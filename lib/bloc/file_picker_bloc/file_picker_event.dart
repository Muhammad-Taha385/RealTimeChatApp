// import 'dart:io';

import 'package:equatable/equatable.dart';

abstract class FilePickerEvent extends Equatable {
  const FilePickerEvent();

  @override
  List<Object?> get props => [];
}

class FilePicked extends FilePickerEvent {
}
