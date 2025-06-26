import 'package:flutter/material.dart';
import 'package:real_time_chat_application/core/enums/enums.dart';

class BaseViewmodel extends ChangeNotifier{
  ViewState _state = ViewState.idle ;
  ViewState get state => _state;

  setstate(ViewState state){
      _state = state;
      notifyListeners();
  }

}