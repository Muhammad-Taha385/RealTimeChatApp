// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:real_time_chat_application/core/constants/colors.dart';
// import 'package:real_time_chat_application/core/constants/strings.dart';
// // import 'package:real_time_chat_application/core/constants/colors.dart';
// import 'package:real_time_chat_application/core/constants/styles.dart';
// import 'package:real_time_chat_application/ui/Widgets/TextField/textfield.dart';
// import 'package:real_time_chat_application/core/utils/toastmessage_utils.dart';

// class SignupScreen extends StatefulWidget {
//   const SignupScreen({super.key});

//   @override
//   State<SignupScreen> createState() => _SignupScreenState();
// }

// class _SignupScreenState extends State<SignupScreen> {
//    FirebaseAuth _auth = FirebaseAuth.instance;

//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   bool loading = false; // Loading state

//     String? emailValidate(value){
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
  

//   @override
//   void dispose() {
//     emailController.dispose();
//     passwordController.dispose();
//     super.dispose();
//   }

//   void submitForm() {
//     if (!_formKey.currentState!.validate()) return; // Only proceed if form is valid

//     setState(() {
//       loading = true;
//     });

//     _auth
//         .createUserWithEmailAndPassword(
//       email: emailController.text.trim(),
//       password: passwordController.text.trim(),
//     )
//         .then((value) {
//       setState(() {
//         loading = false;
//       });
//       Utilities.showToast(message: "User Registered Successfully");
//     }).onError((error, stackTrace) {
//       setState(() {
//         loading = false;
//       });
//       Utilities.showError(error.toString());
//     });
//   }
// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     body: SafeArea(
//       child: SingleChildScrollView( // ✅ Make screen scrollable
//         child: Padding(
//           padding: EdgeInsets.only(
//             bottom: MediaQuery.of(context).viewInsets.bottom, // ✅ Adjust for keyboard
//           ),
//           child: Center(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Form(
//                   key:_formKey,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       SizedBox(height: 60.h),
//                       Text("Create Your Account", style: h),
//                       SizedBox(height: 2.h),
//                       Text("Please Provide The Details!", style: body),
//                       SizedBox(height: 30.h),
//                       Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 8.w),
//                         child: CustomTextField(hintText: "Enter name", onChanged: (p0) {},prefixIcon: Icon(Icons.person),),
//                       ),
//                       SizedBox(height: 25.h),
//                       Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 8.w),
//                         child: CustomTextField(hintText: "Enter email", onChanged: (p0) {},prefixIcon: Icon(Icons.email_rounded),validate: emailValidate,),
//                       ),
//                       SizedBox(height: 25.h),
//                       Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 8.w),
//                         child: CustomTextField(hintText: "Enter password", onChanged: (p0) {},prefixIcon: Icon(Icons.lock_outline),isObscure: true,
//                         validate: 
//                         (value) {
//                         if (value == null || value.isEmpty) {
//                           return "Please enter a password";
//                         }
//                         if (value.length < 8) {
//                           return "Password must contain at least 8 characters";
//                         }
//                         return null;
//                       },
//                       ),
//                       ),
//                       SizedBox(height: 25.h),
//                       Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 8.w),
//                         child: CustomTextField(hintText: "Confirm password", onChanged: (p0) {},prefixIcon: Icon(Icons.lock_outline),isObscure: true,validate: (value){},),
//                       ),
//                       SizedBox(height: 30.h),
//                       CustomButtonWidget(onPressed: () {
//                         if (!loading) submitForm();
//                       }, text: "Sign Up",loading: loading,),
//                       SizedBox(height: 30.h),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text("Already have an account?", style: body.copyWith(color: grey)),
//                           TextButton(
//                             onPressed: () {
//                               Navigator.pushReplacementNamed(context, login);
//                             },
//                             child: Text("Login", style: small.copyWith(color: primary)),
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
//   );
// }
// }
// class CustomButtonWidget extends StatelessWidget {
//   final void Function()? onPressed ;
//   final String text ;
//   final bool loading ;
//   const CustomButtonWidget({
//     super.key,this.onPressed,required this.text,this.loading=false
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: 310.w,
//       height: 40.h,
//       child: ElevatedButton(
//         style: 
//           ElevatedButton.styleFrom(backgroundColor: primary),
//           onPressed:onPressed
//       , child:loading ? const Center(child: CircularProgressIndicator(color: Colors.white,strokeWidth: 3,),): Text(text,style:small.copyWith(color: Colors.white))),
//     );
//   }
// }
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:real_time_chat_application/core/constants/colors.dart';
// import 'package:real_time_chat_application/core/constants/strings.dart';
// import 'package:real_time_chat_application/core/constants/styles.dart';
// import 'package:real_time_chat_application/ui/Widgets/TextField/textfield.dart';
// import 'package:real_time_chat_application/core/utils/toastmessage_utils.dart';

// class SignupScreen extends StatefulWidget {
//   const SignupScreen({super.key});

//   @override
//   State<SignupScreen> createState() => _SignupScreenState();
// }

// class _SignupScreenState extends State<SignupScreen> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController confirmPasswordController = TextEditingController();

//   bool loading = false;

//   // Email validation
//   String? validateEmail(String? value) {
//     if (value == null || value.isEmpty) {
//       return "Please enter an email";
//     }
//     RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
//     if (!emailRegExp.hasMatch(value)) {
//       return "Please enter a valid email";
//     }
//     return null;
//   }

//   // Password validation
//   String? validatePassword(String? value) {
//     if (value == null || value.isEmpty) {
//       return "Please enter a password";
//     }
//     if (value.length < 8) {
//       return "Password must contain at least 8 characters";
//     }
//     return null;
//   }

//   // Confirm password validation
//   String? validateConfirmPassword(String? value) {
//     if (value == null || value.isEmpty) {
//       return "Please confirm your password";
//     }
//     if (value != passwordController.text) {
//       return "Passwords do not match";
//     }
//     return null;
//   }

//   @override
//   void dispose() {
//     emailController.dispose();
//     passwordController.dispose();
//     confirmPasswordController.dispose();
//     super.dispose();
//   }

//   void submitForm() async {
//     if (!_formKey.currentState!.validate()) return;

//     setState(() => loading = true);

//     try {
//       await _auth.createUserWithEmailAndPassword(
//         email: emailController.text.trim(),
//         password: passwordController.text.trim(),
//       );
//       Utilities.showToast(message: "User Registered Successfully");
//     } catch (error) {
//       Utilities.showError(error.toString());
//     } finally {
//       setState(() => loading = false);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: GestureDetector(
//         onTap: () => FocusScope.of(context).unfocus(), // Dismiss keyboard on tap outside
//         child: SafeArea(
//           child: SingleChildScrollView(
//             padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
//             child: Center(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Form(
//                     key: _formKey,
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         SizedBox(height: 60.h),
//                         Text("Create Your Account", style: h),
//                         SizedBox(height: 2.h),
//                         Text("Please Provide The Details!", style: body),
//                         SizedBox(height: 30.h),
//                         Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 8.w),
//                           child: CustomTextField(
//                             hintText: "Enter name",
//                             onChanged: (p0) {},
//                             prefixIcon: const Icon(Icons.person),
//                           ),
//                         ),
//                         SizedBox(height: 25.h),
//                         Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 8.w),
//                           child: CustomTextField(
//                             hintText: "Enter email",
//                             onChanged: (p0) {},
//                             prefixIcon: const Icon(Icons.email_rounded),
//                             validate: validateEmail,
//                             controller: emailController,
//                           ),
//                         ),
//                         SizedBox(height: 25.h),
//                         Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 8.w),
//                           child: CustomTextField(
//                             hintText: "Enter password",
//                             onChanged: (p0) {},
//                             prefixIcon: const Icon(Icons.lock_outline),
//                             isObscure: true,
//                             validate: validatePassword,
//                             controller: passwordController,
//                           ),
//                         ),
//                         SizedBox(height: 25.h),
//                         Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 8.w),
//                           child: CustomTextField(
//                             hintText: "Confirm password",
//                             onChanged: (p0) {},
//                             prefixIcon: const Icon(Icons.lock_outline),
//                             isObscure: true,
//                             validate: validateConfirmPassword,
//                             controller: confirmPasswordController,
//                           ),
//                         ),
//                         SizedBox(height: 30.h),
//                         CustomButtonWidget(
//                           onPressed: () {
//                             if (!loading) submitForm();
//                           },
//                           text: "Sign Up",
//                           loading: loading,
//                         ),
//                         SizedBox(height: 30.h),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text("Already have an account?", style: body.copyWith(color: grey)),
//                             TextButton(
//                               onPressed: () {
//                                 Navigator.pushReplacementNamed(context, login);
//                               },
//                               child: Text("Login", style: small.copyWith(color: primary)),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// // Custom button widget remains unchanged
// class CustomButtonWidget extends StatelessWidget {
//   final void Function()? onPressed;
//   final String text;
//   final bool loading;

//   const CustomButtonWidget({
//     super.key,
//     this.onPressed,
//     required this.text,
//     this.loading = false,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: 310.w,
//       height: 40.h,
//       child: ElevatedButton(
//         style: ElevatedButton.styleFrom(backgroundColor: primary),
//         onPressed: onPressed,
//         child: loading
//             ? const Center(child: CircularProgressIndicator(color: Colors.white, strokeWidth: 3))
//             : Text(text, style: small.copyWith(color: Colors.white)),
//       ),
//     );
//   }
// }
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_time_chat_application/core/constants/colors.dart';
import 'package:real_time_chat_application/core/constants/strings.dart';
import 'package:real_time_chat_application/core/constants/styles.dart';
import 'package:real_time_chat_application/ui/Widgets/TextField/textfield.dart';
import 'package:real_time_chat_application/core/utils/toastmessage_utils.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  bool loading = false;

  String? emailValidate(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter an email";
    }
    RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(value)) {
      return "Please enter a valid email";
    }
    return null;
  }

  String? nameValidate(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Please enter your name";
    }
    return null;
  }

  String? passwordValidate(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter a password";
    }
    if (value.length < 8) {
      return "Password must be at least 8 characters";
    }
    return null;
  }

  String? confirmPasswordValidate(String? value) {
    if (value == null || value.isEmpty) {
      return "Please confirm your password";
    }
    if (value != passwordController.text) {
      return "Passwords do not match";
    }
    return null;
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> submitForm() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => loading = true);

    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      await userCredential.user!.updateDisplayName(nameController.text.trim());

      Utilities.showToast(message: "User Registered Successfully");
      Navigator.pushReplacementNamed(context, login);
    } on FirebaseAuthException catch (e) {
      String message = "Registration failed";

      if (e.code == 'email-already-in-use') {
        message = "This email is already in use.";
      } else if (e.code == 'weak-password') {
        message = "Password is too weak.";
      } else if (e.code == 'invalid-email') {
        message = "Invalid email format.";
      }

      Utilities.showError(message);
    } catch (e) {
      Utilities.showError("An unexpected error occurred");
    } finally {
      setState(() => loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: 60.h),
                        Text("Create Your Account", style: h),
                        SizedBox(height: 2.h),
                        Text("Please Provide The Details!", style: body),
                        SizedBox(height: 30.h),

                        // Name
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          child: CustomTextField(
                            hintText: "Enter name",
                            controller: nameController,
                            onChanged: (p0) {},
                            prefixIcon: const Icon(Icons.person),
                            validate: nameValidate,
                          ),
                        ),
                        SizedBox(height: 25.h),

                        // Email
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          child: CustomTextField(
                            hintText: "Enter email",
                            controller: emailController,
                            onChanged: (p0) {},
                            prefixIcon: const Icon(Icons.email_rounded),
                            validate: emailValidate,
                          ),
                        ),
                        SizedBox(height: 25.h),

                        // Password
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          child: CustomTextField(
                            hintText: "Enter password",
                            controller: passwordController,
                            onChanged: (p0) {},
                            prefixIcon: const Icon(Icons.lock_outline),
                            isObscure: true,
                            validate: passwordValidate,
                          ),
                        ),
                        SizedBox(height: 25.h),

                        // Confirm Password
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          child: CustomTextField(
                            hintText: "Confirm password",
                            controller: confirmPasswordController,
                            onChanged: (p0) {},
                            prefixIcon: const Icon(Icons.lock_outline),
                            isObscure: true,
                            validate: confirmPasswordValidate,
                          ),
                        ),
                        SizedBox(height: 30.h),

                        // Sign Up Button
                        CustomButtonWidget(
                          onPressed: () {
                            if (!loading) submitForm();
                          },
                          text: "Sign Up",
                          loading: loading,
                        ),
                        SizedBox(height: 30.h),

                        // Login Redirect
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Already have an account?", style: body.copyWith(color: grey)),
                            TextButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(context, login);
                              },
                              child: Text("Login", style: small.copyWith(color: primary)),
                            ),
                          ],
                        ),
                      ],
                    ),
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

// Custom Button Widget
class CustomButtonWidget extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final bool loading;

  const CustomButtonWidget({
    super.key,
    this.onPressed,
    required this.text,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 310.w,
      height: 40.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: primary),
        onPressed: onPressed,
        child: loading
            ? const Center(child: CircularProgressIndicator(color: Colors.white, strokeWidth: 3))
            : Text(text, style: small.copyWith(color: Colors.white)),
      ),
    );
  }
}


