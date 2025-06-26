// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// // import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:real_time_chat_application/core/constants/colors.dart';
// import 'package:real_time_chat_application/core/constants/strings.dart';
// // import 'package:real_time_chat_application/core/constants/colors.dart';
// import 'package:real_time_chat_application/core/constants/styles.dart';
// import 'package:real_time_chat_application/core/utils/toastmessage_utils.dart';
// import 'package:real_time_chat_application/ui/Widgets/TextField/textfield.dart';
// import 'package:real_time_chat_application/ui/screens/auth/signup/signup_screen.dart';
// import 'package:real_time_chat_application/ui/screens/home/home_screen.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//    bool loading  = false;
//   FirebaseAuth _auth = FirebaseAuth.instance;
//   void login(){
//     setState(() {
//       loading  = true;
//     });
//     _auth.signInWithEmailAndPassword(email: emailController.text.toString(), password: passwordController.text.toString())
//     .then((value){
//       setState(() {
        
//       loading = false;
//       });
//       Utilities.showToast(message: "Logged in Successfully");
//       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
//       // utilities().toastMessage(value.)
//     })
//     .onError((error, stackTrace) {
//       debugPrint(error.toString());
//       Utilities.showToast(message: error.toString());
//       setState(() {
        
//       loading = false;
//       });
//     },);
//   }
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//     emailController.dispose();
//     passwordController.dispose();
//   }
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final GlobalKey<FormState> _formKey  = GlobalKey<FormState>();
//   void submitform(){
//     if(_formKey.currentState!.validate()){}

//   }
//   String? emailValidate(value){
//     if(value!.isEmpty){
//       return"Please enter an email";
//     }
//     RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
//     if(!emailRegExp.hasMatch(value)){
//       return "Please enter valid email ";
//     }
//     // if(value!.length < 8){
//     //   return"email should be greater then 8 ";
//     // }
//     return null;

//   }
//   String? passwordValidate(value){
//     if(value.isEmpty){
//       return "Please enter password";
//     }
//     if(value!.length<8){
//       return"Password must contain 8 characters";
//     }
//     return null;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//     body: SafeArea(
//       child: SingleChildScrollView( // ✅ Make screen scrollable
//         child: Padding(
//           padding: EdgeInsets.only(
//             bottom: MediaQuery.of(context).viewInsets.bottom, // ✅ Adjust for keyboard
//           ),
//           child: Center(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Form(
//                   key: _formKey,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       SizedBox(height: 60.h),
//                       Text("Login", style: h),
//                       SizedBox(height: 2.h),
//                       Text("Please Log In To Your Account!", style: body),
//                       SizedBox(height: 30.h),
//                       // Padding(
//                       //   padding: EdgeInsets.symmetric(horizontal: 8.w),
//                       //   child: CustomTextField(hintText: "Enter name", onChanged: (p0) {},prefixIcon: Icon(Icons.person),),
//                       // ),
//                       // SizedBox(height: 25.h),
//                       Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 8.w),
//                         child: CustomTextField(hintText: "Enter email", onChanged: (p0) {},prefixIcon: Icon(Icons.email_rounded),controller:emailController ,validate: emailValidate,),
//                       ),
//                       SizedBox(height: 25.h),
//                       Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 8.w),
//                         child: CustomTextField(hintText: "Enter password", onChanged: (p0) {},prefixIcon: Icon(Icons.lock_outline),isObscure: true,validate: passwordValidate,controller: passwordController,),
//                       ),
//                       // SizedBox(height: 25.h),
//                       // Padding(
//                       //   padding: EdgeInsets.symmetric(horizontal: 8.w),
//                       //   child: CustomTextField(hintText: "Confirm password", onChanged: (p0) {},prefixIcon: Icon(Icons.lock_outline),isObscure: true,),
//                       // ),
//                       SizedBox(height: 30.h),
//                       CustomButtonWidget(loading: loading
//                       ,onPressed: () {
//                         submitform();
//                         if(!loading)login();
//                       }, text: "Login"),
//                       SizedBox(height: 30.h),
                      
//                       Row(

//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           SizedBox(
//                             width: 20.w,
//                           ),
//                           Container(
//                             width: 100.w,
//                             height:1.h ,
//                             color: Colors.grey.shade300,
//                           ),
//                                                     SizedBox(
//                             width:10.w,
//                           ),
//                           Text("Or continue with",style:body.copyWith(fontSize: 14),),
//                                                                               SizedBox(
//                             width:10.w,
//                           ),
//                                                     Container(
//                             width: 100.w,
//                             height:1.h ,
//                             color: Colors.grey.shade300,
//                           ),
//                                                     SizedBox(
//                             width: 20.w,
//                           ),
//                         ],
//                       ),

//                       SizedBox(
//                         height: 80.h,
//                       ),

//                       Container(
//   padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
//   decoration: BoxDecoration(
//     color: Colors.white, // or any background color
//     borderRadius: BorderRadius.circular(12.r),
//     border: Border.all(color: Colors.grey.shade300),
//     boxShadow: [
//       BoxShadow(
//         color: Colors.grey.withOpacity(0.2),
//         spreadRadius: 1,
//         blurRadius: 5,
//         offset: Offset(0, 3),
//       ),
//     ],
//   ),
//   child: Row(
//     mainAxisAlignment: MainAxisAlignment.center,
//     mainAxisSize: MainAxisSize.min,
//     children: [
//       ClipRRect(
//         borderRadius: BorderRadius.circular(10.r),
//         child: Image.asset(
//           glogo,
//           height: 30.h,
//           width: 35.h,
//           fit: BoxFit.fill,
//         ),
//       ),
//       SizedBox(width: 10.w),
//       Text(
//         "Continue with Google",
//         style: TextStyle(
//           fontSize: 14.sp,
//           fontWeight: FontWeight.w500,
//         ),
//       ),
//     ],
//   ),
// ),


//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text("Don’t have an account?", style: body.copyWith(color: grey)),
//                           TextButton(
//                             onPressed: () {
//                               Navigator.pushReplacementNamed(context, signup);
//                             },
//                             child: Text("Sign Up", style: small.copyWith(color: primary)),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     ),
//   );;
//   }
// }
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_time_chat_application/core/constants/colors.dart';
import 'package:real_time_chat_application/core/constants/strings.dart';
import 'package:real_time_chat_application/core/constants/styles.dart';
import 'package:real_time_chat_application/core/services/auth_service.dart';
import 'package:real_time_chat_application/core/utils/toastmessage_utils.dart';
import 'package:real_time_chat_application/ui/Widgets/TextField/textfield.dart';
import 'package:real_time_chat_application/ui/screens/auth/signup/signup_screen.dart';
import 'package:real_time_chat_application/ui/screens/home/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool loading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void submitForm() {
    if (_formKey.currentState!.validate()) {
      FocusScope.of(context).unfocus();
      login();
    }
  }

  void login() async {
    setState(() => loading = true);
    try {
      await _auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      Utilities.showToast(message: "Logged in Successfully");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
    } catch (error) {
      debugPrint(error.toString());
      Utilities.showToast(message:(error.toString()));
    } finally {
      setState(() => loading = false);
    }
  }

//  String getFriendlyErrorMessage(String errorCode) {
//   switch (errorCode) {
//     case "user-not-found":
//       return "No user found for this email.";
//     case "wrong-password":
//       return "Incorrect password.";
//     case "invalid-email":
//       return "Email address is not valid.";
//     case "user-disabled":
//       return "This user has been disabled.";
//     default:
//       return "Login failed. Please try again.";
//   }
// }


  String? emailValidate(String? value) {
    if (value == null || value.isEmpty) return "Please enter an email";
    final RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(value)) return "Please enter a valid email";
    return null;
  }

  String? passwordValidate(String? value) {
    if (value == null || value.isEmpty) return "Please enter password";
    if (value.length < 8) return "Password must be at least 8 characters";
    return null;
  }

  Widget buildGoogleLoginButton() {
  return InkWell(
     onTap: () async {
      setState(() => loading = true);
      try {
        final result = await AuthService().signInWithGoogle();
        if (result == null) {
          Utilities.showToast(message: "Google sign-in cancelled");
        } else {
          Utilities.showToast(message: "Logged in Successfully");
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const HomeScreen()),
          );
        }
      } catch (e) {
        debugPrint(e.toString());
        Utilities.showToast(message: "Google Sign-in failed: ${e.toString()}");
      } finally {
        setState(() => loading = false);
      }
    },
    child: SizedBox(
      width: 310.w,
      height: 40.h,
      child: Container(
        // height: 40.h,
        // width: 40.w,
        decoration: BoxDecoration(
          color: Colors.grey.shade700,
          borderRadius: BorderRadius.circular(50.r),
          // border: Border.all(color: Colors.grey.shade300),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              glogo,
              height: 24.h,
              width: 24.h,
            ),
            SizedBox(width: 12.w),
            Text(
              'Sign in with Google',
              style: TextStyle(
                fontSize: 15.sp,
                color: Colors.black87,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w).copyWith(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 60.h),
                  Image.asset(applogo,
                  height: 140.h,
                  width: 140.w,
                  ),
                  // Text("Login", style: h),
                  // SizedBox(height: 4.h),
                  // Text("Please Log In To Your Account!", style: body),
                  // SizedBox(height: 30.h),
                  CustomTextField(
                    hintText: "Enter email",
                    onChanged: (_) {},
                    prefixIcon: const Icon(Icons.email_rounded),
                    controller: emailController,
                    validate: emailValidate,
                  ),
                  SizedBox(height: 25.h),
                  CustomTextField(
                    hintText: "Enter password",
                    onChanged: (_) {},
                    prefixIcon: const Icon(Icons.lock_rounded),
                    isObscure: true,
                    controller: passwordController,
                    validate: passwordValidate,
                  ),
                  SizedBox(height: 30.h),
                  CustomButtonWidget(
                    loading: loading,
                    onPressed: submitForm,
                    text: "Login",
                  ),
                  SizedBox(height: 30.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(child: Divider(color: Colors.grey.shade300, thickness: 1)),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: Text("Or continue with", style: body.copyWith(fontSize: 14)),
                      ),
                      Expanded(child: Divider(color: Colors.grey.shade300, thickness: 1)),
                    ],
                  ),
                  SizedBox(height: 40.h),
                  buildGoogleLoginButton(),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don’t have an account?", style: body.copyWith(color: grey)),
                      TextButton(
                        onPressed: () => Navigator.pushNamed(context, signup),
                        child: Text("Sign Up", style: small.copyWith(color: primary)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
