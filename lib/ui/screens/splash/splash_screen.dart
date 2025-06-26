import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_time_chat_application/core/constants/strings.dart';
import 'package:real_time_chat_application/ui/screens/auth/login/login_screen.dart';
import 'package:real_time_chat_application/ui/screens/home/home_screen.dart';
// import 'package:real_time_chat_application/ui/screens/auth/signup/signup_screen.dart';
// import 'package:real_time_chat_application/ui/screens/signup_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _navigateToLogin();
  }
  void _navigateToLogin() async {
    await Firebase.initializeApp(); // Ensure Firebase is initialized
    FirebaseAuth _auth = FirebaseAuth.instance;
    final user = _auth.currentUser; // Now it's safe to use
      
    if(user!=null){
            Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    }
    else{
      _timer = Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(_createSlideRoute());
    });
         
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Route _createSlideRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const LoginScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0); // From right
        const end = Offset.zero;
        const curve = Curves.ease;

        final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 2300),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            frame,
            height: 1.sh,
            width: 1.sw,
            fit: BoxFit.cover,
          ),
          Center(
            child: Image.asset(
              logo,
              height: 170,
              width: 170,
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }
}
