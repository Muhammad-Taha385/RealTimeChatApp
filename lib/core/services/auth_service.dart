// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class AuthService {
//   signInWithGoogle()async{
//     final GoogleSignInAccount? guser = await GoogleSignIn().signIn();
//     final GoogleSignInAuthentication gAuth = await guser!.authentication;
//     final credential = GoogleAuthProvider.credential(
//         accessToken: gAuth.accessToken,
//         idToken: gAuth.idToken,

//     );
//     return await FirebaseAuth.instance.signInWithCredential(credential);
//   }
// }
// core/services/auth_service.dart

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return null; // User canceled

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      return await _auth.signInWithCredential(credential);
    } catch (e) {
      rethrow;
    }
  }
}
