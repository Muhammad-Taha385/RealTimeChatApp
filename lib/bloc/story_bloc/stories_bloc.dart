import 'dart:convert';
import 'dart:io';
// import 'package:ffmpeg_kit_flutter_full/ffmpeg_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
// import 'package:ffmpeg_kit_flutter_full/ffmpeg_kit.dart';
// import 'package:ffmpeg_kit_flutter_min_gpl/ffmpeg_kit.dart';
import 'package:video_player/video_player.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:real_time_chat_application/bloc/story_bloc/stories_event.dart';
import 'package:real_time_chat_application/bloc/story_bloc/stories_state.dart';
import 'package:real_time_chat_application/core/models/stories_model.dart';
import 'package:real_time_chat_application/core/services/database_service.dart';
import 'package:real_time_chat_application/core/services/file_picker_service.dart';
import 'package:real_time_chat_application/core/services/firebase_story_service.dart';

class StoryBloc extends Bloc<StoryEvent, StoryState> {
  final FirestoreStoryService _storyService = FirestoreStoryService();
  final DatabaseService _db = DatabaseService();
  final StoryFilePickerService _fileService = StoryFilePickerService();

  StoryBloc() : super(StoryInitial()) {
    on<FilePicked>(_onFilePicked);
    on<UploadStory>(_uploadStory);
    on<FetchAllStories>(_fetchAllStories);
  }

  Future<void> _onFilePicked(FilePicked event, Emitter<StoryState> emit) async {
    emit(StoryLoading());
    try {
      final file = await _fileService.pickStoryFile();
      if (file == null) {
        emit(StoryError("No file selected"));
        return;
      }

      final ext = p.extension(file.path).toLowerCase();
      File readyFile = file;

      if ([".mov", ".mkv", ".avi"].contains(ext)) {
        emit(StoryConverting());
        readyFile = await _convertToMp4(file);
      }

      if (_isVideo(readyFile.path)) {
        final controller = VideoPlayerController.file(readyFile);
        await controller.initialize();
        await controller.setLooping(true);
        await controller.play();

        emit(StoryVideoReady(readyFile, controller));
      } else {
        emit(StoryFileSelected(readyFile));
      }
    } catch (e) {
      emit(StoryError("Error selecting file: $e"));
    }
  }

  Future<void> _uploadStory(UploadStory event, Emitter<StoryState> emit) async {
    emit(StoryLoading());
    const cloudName = "dudf7hn2n";
    const uploadPreset = "flutter_upload";
    final uploadUrl =
        Uri.parse("https://api.cloudinary.com/v1_1/$cloudName/upload");

    try {
      final request = http.MultipartRequest("POST", uploadUrl)
        ..fields["upload_preset"] = uploadPreset
        ..files.add(await http.MultipartFile.fromPath("file", event.filePath));

      final response = await request.send();
      final resBody = await response.stream.bytesToString();
      final jsonResponse = json.decode(resBody);

      if (response.statusCode == 200) {
        final mediaUrl = jsonResponse["secure_url"];
        final story = StoriesModel(
          fromUid: event.uid,
          mediaUrl: mediaUrl,
          status: "active",
          timeStamp: DateTime.now(),
          toUids: await _getFriendUids(),
        );

        await _storyService.addStory(story);
        emit(StoryUploaded());
      } else {
        emit(StoryError("Upload failed: ${jsonResponse.toString()}"));
      }
    } catch (e) {
      emit(StoryError("Upload error: $e"));
    }
  }

  Future<void> _fetchAllStories(
      FetchAllStories event, Emitter<StoryState> emit) async {
    emit(StoryLoading());
    try {
      _storyService.getAllStories().listen((stories) {
        emit(StoryLoaded(stories));
      });
    } catch (e) {
      emit(StoryError(e.toString()));
    }
  }

  Future<File> _convertToMp4(File inputFile) async {
    final dir = await getTemporaryDirectory();
    final outputPath =
        p.join(dir.path, "converted_${DateTime.now().millisecondsSinceEpoch}.mp4");

    final command =
        '-y -i "${inputFile.path}" -vcodec libx264 -pix_fmt yuv420p -acodec aac "$outputPath"';

    final session = await FFmpegKit.execute(command);
    final returnCode = await session.getReturnCode();

    if (returnCode?.isValueSuccess() ?? false) {
      final outputFile = File(outputPath);
      if (await outputFile.exists()) return outputFile;
      throw Exception("Converted file missing.");
    } else {
      final logs = await session.getAllLogsAsString();
      throw Exception("FFmpeg failed: $logs");
    }
  }

  bool _isVideo(String path) {
    final ext = path.split('.').last.toLowerCase();
    return ['mp4', 'mov', 'mkv', 'avi'].contains(ext);
  }

  Future<List<String>> _getFriendUids() async {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final friends = await _db.fetchfriendsContacts(uid);
    return friends.map((u) => u.uid).toList();
  }
}
