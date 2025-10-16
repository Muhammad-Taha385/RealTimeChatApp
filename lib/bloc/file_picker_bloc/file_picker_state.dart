import 'dart:io';

import 'package:equatable/equatable.dart';

class FilePickerState extends Equatable {
  final File? file;
  const FilePickerState({this.file});

  FilePickerState copyWith({File? file}) {
    return FilePickerState
    (
      file: file ?? this.file,
    );
  }

  @override
  List<Object?> get props => [file];
}
