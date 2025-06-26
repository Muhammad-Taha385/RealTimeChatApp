import 'package:flutter/material.dart';
import 'package:real_time_chat_application/core/constants/strings.dart';
import 'package:real_time_chat_application/ui/screens/auth/login/login_screen.dart';
import 'package:real_time_chat_application/ui/screens/auth/signup/signup_screen.dart';
import 'package:real_time_chat_application/ui/screens/home/home_screen.dart';
import 'package:real_time_chat_application/ui/screens/splash/splash_screen.dart';

class RouteUtils {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings){

    switch(settings.name){
      case splash :
      return MaterialPageRoute(builder: (context)=>SplashScreen());
      case home:
      return MaterialPageRoute(builder: (context)=>HomeScreen());
      case signup:
      return MaterialPageRoute(builder: (context)=>SignupScreen());
      case login:
      return MaterialPageRoute(builder: (context)=>LoginScreen());
      default:
      return MaterialPageRoute(builder: (context)=>Scaffold(body: Text("No Route Found"),));
    }
    // return null;
  }
}