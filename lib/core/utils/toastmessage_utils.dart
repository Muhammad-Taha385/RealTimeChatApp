import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// class utilities{
//   void toastMessage(String message){
//     Fluttertoast.showToast(
//         msg: message,
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.CENTER,
//         timeInSecForIosWeb: 1,
//         backgroundColor: Colors.red,
//         textColor: Colors.white,
//         fontSize: 16.0
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';

class Utilities {
  /// Shows a toast message with default styling
  static void showToast({
    required String message,
    ToastGravity gravity = ToastGravity.BOTTOM,
    Color backgroundColor = Colors.black87,
    Color textColor = Colors.white,
    double fontSize = 14.0,
    Toast toastLength = Toast.LENGTH_SHORT,
  }) {
    Fluttertoast.cancel(); // Prevent overlapping toasts
    Fluttertoast.showToast(
      msg: message,
      toastLength: toastLength,
      gravity: gravity,
      timeInSecForIosWeb: 1,
      backgroundColor: backgroundColor,
      textColor: textColor,
      fontSize: fontSize,
    );
  }

  /// Shortcut for showing success messages
  static void showSuccess(String message) {
    showToast(
      message: message,
      backgroundColor: Colors.green,
    );
  }

  /// Shortcut for showing error messages
  static void showError(String message) {
    showToast(
      message: message,
      backgroundColor: Colors.red,
    );
  }

  /// Shortcut for showing warning messages
  static void showWarning(String message) {
    showToast(
      message: message,
      backgroundColor: Colors.orange,
    );
  }
}
