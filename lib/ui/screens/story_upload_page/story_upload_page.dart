// import 'dart:io';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:real_time_chat_application/bloc/story_bloc/stories_bloc.dart';
// import 'package:real_time_chat_application/bloc/story_bloc/stories_event.dart';
// import 'package:real_time_chat_application/bloc/story_bloc/stories_state.dart';
// import 'package:video_player/video_player.dart';
// import 'package:ffmpeg_kit_flutter_full/ffmpeg_kit.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:path/path.dart' as p;

// class StoryUploadPage extends StatefulWidget {
//   final String currentUid;
//   const StoryUploadPage({super.key, required this.currentUid});

//   @override
//   State<StoryUploadPage> createState() => _StoryUploadPageState();
// }

// class _StoryUploadPageState extends State<StoryUploadPage> {
//   VideoPlayerController? _videoController;

//   @override
//   void dispose() {
//     _videoController?.dispose();
//     super.dispose();
//   }

//   bool _isVideo(String path) {
//     final ext = path.split(".").last.toLowerCase();
//     return ["mp4", "mov"].contains(ext);
//   }

//   // Future<void> _setupVideo(File file) async {
//   //   _videoController?.dispose();
//   //   _videoController = VideoPlayerController.file(file);
//   //   await _videoController!.initialize();
//   //   await _videoController!.setLooping(true);
//   //   await _videoController!.play();
//   // }
//   Future<void> _setupVideo(File file) async {
//   try {
//     _videoController?.dispose();
//     _videoController = VideoPlayerController.file(file);

//     await _videoController!.initialize();
//     if (!mounted) return; // prevent setState after widget dispose
//     await _videoController!.setLooping(true);
//     await _videoController!.play();
//   } catch (e) {
//     debugPrint("Video init failed: $e");
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text("Video cannot be played: ${file.path.split('/').last}")),
//     );
//   }
// }
// Future<File> convertToMp4(File inputFile) async {
//   final dir = await getTemporaryDirectory();
//   final outputPath = p.join(dir.path, "converted_${DateTime.now().millisecondsSinceEpoch}.mp4");

//   final command =
//       '-i "${inputFile.path}" -vcodec libx264 -pix_fmt yuv420p -acodec aac -strict -2 "$outputPath"';

//   await FFmpegKit.execute(command);

//   final outputFile = File(outputPath);
//   if (await outputFile.exists()) {
//     debugPrint("✅ Video converted successfully: $outputPath");
//     return outputFile;
//   } else {
//     throw Exception("❌ Conversion failed");
//   }
// }



//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Add Story")),
//       body: BlocConsumer<StoryBloc, StoryState>(
//         listener: (context, state) async {
//           if (state is StoryUploaded) {
//             ScaffoldMessenger.of(context)
//                 .showSnackBar(const SnackBar(content: Text("Story uploaded!")));
//             _videoController?.dispose();
//             _videoController = null;
//           } else if (state is StoryFileSelected) {
//             if (_isVideo(state.file.path)) {
//               await _setupVideo(state.file);
//             } else {
//               _videoController?.dispose();
//               _videoController = null;
//             }
//           } else if (state is StoryError) {
//             ScaffoldMessenger.of(context)
//                 .showSnackBar(SnackBar(content: Text(state.error)));
//           }
//         },
//         builder: (context, state) {
//           Widget preview = const SizedBox();

//           if (state is StoryFileSelected) {
//             final file = state.file;
//             if (_isVideo(file.path)) {
//               if (_videoController != null &&
//                   _videoController!.value.isInitialized) {
//                 preview = AspectRatio(
//                   aspectRatio: _videoController!.value.aspectRatio,
//                   child: VideoPlayer(_videoController!),
//                 );
//               } else {
//                 preview = const CircularProgressIndicator();
//               }
//             } else {
//               preview = Image.file(file, height: 200);
//             }
//           } else if (state is StoryLoading) {
//             preview = const CircularProgressIndicator();
//           }

//           return Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 preview,
//                 const SizedBox(height: 20),
//                 ElevatedButton.icon(
//                   onPressed: () =>
//                       context.read<StoryBloc>().add(FilePicked()),
//                   icon: const Icon(Icons.upload),
//                   label: const Text("Pick Image/Video"),
//                 ),
//                 const SizedBox(height: 15),
//                 if (state is StoryFileSelected)
//                   ElevatedButton.icon(
//                     onPressed: () {
//                       final uid = FirebaseAuth.instance.currentUser!.uid;
//                       context
//                           .read<StoryBloc>()
//                           .add(UploadStory(uid, state.file.path));
//                     },
//                     icon: const Icon(Icons.cloud_upload),
//                     label: const Text("Upload Story"),
//                   ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';
import 'package:real_time_chat_application/bloc/story_bloc/stories_bloc.dart';
import 'package:real_time_chat_application/bloc/story_bloc/stories_event.dart';
import 'package:real_time_chat_application/bloc/story_bloc/stories_state.dart';

class StoryUploadPage extends StatefulWidget {
  final String currentUid;
  const StoryUploadPage({super.key, required this.currentUid});

  @override
  State<StoryUploadPage> createState() => _StoryUploadPageState();
}

class _StoryUploadPageState extends State<StoryUploadPage> {
  VideoPlayerController? _controller;

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  bool _isVideo(String path) {
    final ext = path.split('.').last.toLowerCase();
    return ['mp4', 'mov', 'mkv', 'avi'].contains(ext);
  }

  Future<void> _initializeVideo(File file) async {
    _controller?.dispose();
    _controller = VideoPlayerController.file(file);
    await _controller!.initialize();
    await _controller!.setLooping(true);
    await _controller!.play();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Story")),
      body: BlocConsumer<StoryBloc, StoryState>(
        listener: (context, state) async {
          if (state is StoryUploaded) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("✅ Story uploaded successfully!")),
            );
            _controller?.dispose();
            _controller = null;
          } else if (state is StoryFileSelected) {
            if (_isVideo(state.file.path)) {
              await _initializeVideo(state.file);
            } else {
              _controller?.dispose();
              _controller = null;
            }
          } else if (state is StoryError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        builder: (context, state) {
          Widget content = const SizedBox();

          if (state is StoryLoading) {
            content = const CircularProgressIndicator();
          } else if (state is StoryConverting) {
            content = const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 10),
                Text("Converting video... Please wait"),
              ],
            );
          } else if (state is StoryFileSelected) {
            if (_isVideo(state.file.path)) {
              content = _controller != null &&
                      _controller!.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: _controller!.value.aspectRatio,
                      child: VideoPlayer(_controller!),
                    )
                  : const CircularProgressIndicator();
            } else {
              content = Image.file(state.file, height: 200);
            }
          }

          return Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  content,
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: () =>
                        context.read<StoryBloc>().add(FilePicked()),
                    icon: const Icon(Icons.upload),
                    label: const Text("Pick Image/Video"),
                  ),
                  const SizedBox(height: 15),
                  if (state is StoryFileSelected)
                    ElevatedButton.icon(
                      onPressed: () {
                        final uid = FirebaseAuth.instance.currentUser!.uid;
                        context
                            .read<StoryBloc>()
                            .add(UploadStory(uid, state.file.path));
                      },
                      icon: const Icon(Icons.cloud_upload),
                      label: const Text("Upload Story"),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}


