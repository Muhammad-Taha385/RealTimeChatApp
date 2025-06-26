import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_time_chat_application/core/utils/route_utils.dart';
import 'package:real_time_chat_application/firebase_options.dart';
import 'package:real_time_chat_application/ui/screens/splash/splash_screen.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      // designSize:const Size(375, 812) ,
      builder: (context, child) => 
        const MaterialApp(
          onGenerateRoute: RouteUtils.onGenerateRoute,
          home: SplashScreen(),
      ),
    );
  }
}
