import 'package:equatable/equatable.dart';

abstract class StoryEvent extends Equatable {
  const StoryEvent();

  @override
  List<Object?> get props => [];
}

class UploadStory extends StoryEvent {
  final String uid;
  final String filePath;
  const UploadStory(this.uid, this.filePath);

  @override
  List<Object?> get props => [uid, filePath];
}

class FetchAllStories extends StoryEvent {}

class FilePicked extends StoryEvent {}
