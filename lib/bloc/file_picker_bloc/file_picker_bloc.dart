import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_time_chat_application/bloc/file_picker_bloc/file_picker_event.dart';
import 'package:real_time_chat_application/bloc/file_picker_bloc/file_picker_state.dart';
import 'package:real_time_chat_application/core/services/file_picker_service.dart';

class FilePickerBloc extends Bloc<FilePickerEvent, FilePickerState> {
  final StoryFilePickerService _fileService = StoryFilePickerService();

  FilePickerBloc() : super(FilePickerState()) {
    on<FilePicked>(_onFilePicked);
  }

  void _onFilePicked(FilePicked event, Emitter<FilePickerState> emit) async {
    File? file = await _fileService.pickStoryFile();
    emit(state.copyWith(file:file));
  }
}
