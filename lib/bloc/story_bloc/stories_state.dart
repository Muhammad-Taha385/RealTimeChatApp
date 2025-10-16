import 'dart:io';
import 'package:real_time_chat_application/core/models/stories_model.dart';
import 'package:video_player/video_player.dart';

abstract class StoryState {}

class StoryInitial extends StoryState {}

class StoryLoading extends StoryState {}

class StoryConverting extends StoryState {}

class StoryUploaded extends StoryState {}

class StoryError extends StoryState {
  final String error;
  StoryError(this.error);
}

class StoryLoaded extends StoryState {
  final List<StoriesModel> stories;
  StoryLoaded(this.stories);
}

class StoryFileSelected extends StoryState {
  final File file;
  StoryFileSelected(this.file);
}

class StoryVideoReady extends StoryState {
  final File file;
  final VideoPlayerController controller;
  StoryVideoReady(this.file, this.controller);
}
