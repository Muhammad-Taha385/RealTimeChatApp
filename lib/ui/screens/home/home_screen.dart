import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:real_time_chat_application/core/utils/toastmessage_utils.dart';
import 'package:real_time_chat_application/ui/screens/auth/login/login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
  FirebaseAuth _auth = FirebaseAuth.instance;
    return  Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Home Screen"),
        ),
        actions: [
          IconButton(onPressed: (){
            _auth.signOut().then((value){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
            }).onError((error, stackTrace) {
              Utilities.showToast(message: error.toString());
            },);
          }, icon: Icon(Icons.logout_outlined))
        ],
      ),
    );
  }
}