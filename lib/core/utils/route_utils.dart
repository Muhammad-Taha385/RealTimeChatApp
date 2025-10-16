// import 'package:flutter/material.dart';
// import 'package:real_time_chat_application/core/constants/strings.dart';
// import 'package:real_time_chat_application/core/models/usermodel.dart';
// import 'package:real_time_chat_application/ui/screens/auth/login/login_screen.dart';
// import 'package:real_time_chat_application/ui/screens/auth/login/loginn_screen.dart';
// import 'package:real_time_chat_application/ui/screens/auth/login/new_login_screen.dart';
// import 'package:real_time_chat_application/ui/screens/auth/signup/signup_screen.dart';
// import 'package:real_time_chat_application/ui/screens/chatroom/chat_room.dart';
// import 'package:real_time_chat_application/ui/screens/home/home_screen.dart';
// import 'package:real_time_chat_application/ui/screens/splash/splash_screen.dart';
// import 'package:real_time_chat_application/ui/screens/wrapper/wrapper.dart';

// class RouteUtils {
//   static Route<dynamic>? onGenerateRoute(RouteSettings settings){
//       final args  = settings.arguments;
//     switch(settings.name){
//       case wrapper:
//       // return MaterialPageRoute(builder: (context)=>Wrapper());
//       return MaterialPageRoute(builder: (context)=>const UserSessionHandling());
//       case splash :
//       return MaterialPageRoute(builder: (context)=>SplashScreen());
//       case home:
//       // final uid = args as String?;
  
//       return MaterialPageRoute(builder: (context) => HomeScreen());
 
//       case signup:
//       return MaterialPageRoute(builder: (context)=>SignupScreen());
//       case login:
//       return MaterialPageRoute(builder: (context)=>LoginScreen());

//       case chatRoom:
//       return MaterialPageRoute(builder: (context)=>ChatRoom(
//         currentUser: args['currentUser'] as Usermodel,
//       receiver: args['receiver'] as Usermodel,
//        ));
//       default:
//       return MaterialPageRoute(builder: (context)=>Scaffold(body: Text("No Route Found"),));
//     }
//     // return null;
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:real_time_chat_application/core/constants/strings.dart';
import 'package:real_time_chat_application/core/models/usermodel.dart';
// import 'package:real_time_chat_application/ui/screens/auth/login/login_screen.dart';
import 'package:real_time_chat_application/ui/screens/auth/login/loginn_screen.dart';
import 'package:real_time_chat_application/ui/screens/auth/signup/signup_screen.dart';
import 'package:real_time_chat_application/ui/screens/chatroom/chat_room.dart';
import 'package:real_time_chat_application/ui/screens/contact_screen/contact_screen.dart';
import 'package:real_time_chat_application/ui/screens/home/home_screen.dart';
import 'package:real_time_chat_application/ui/screens/splash/splash_screen.dart';
import 'package:real_time_chat_application/ui/screens/wrapper/wrapper.dart';

class RouteUtils {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
        final currentUid = FirebaseAuth.instance.currentUser?.uid ?? "";

    final args = settings.arguments;

    switch (settings.name) {
      case wrapper:
        return MaterialPageRoute(
          builder: (_) => const UserSessionHandling(),
        );

      case splash:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );

      case home:
          // final data = args as Map<String, dynamic>;

        return MaterialPageRoute(
          builder: (_) => const HomeScreen(
            // currentUser: data['currentUser'] as Usermodel,
          ),
        );

      case signup:
        return MaterialPageRoute(
          builder: (_) => const SignupScreen(),
        );

      case login:
        return MaterialPageRoute(
          builder: (_) =>  LoginScreen(),
        );

      case contacts:

        return MaterialPageRoute(builder: 
        (_)=> ContactScreen(currentUserId: currentUid)
        );
      case chatRoom:
        final data = args as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => ChatRoom(
            currentUser: data['currentUser'] as Usermodel ,
            // currentUser: Usermodel,
            // currentUser: Usermodel,
            receiver: data['receiver'] as Usermodel,
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text("No Route Found")),
          ),
        );
    }
  }
}
