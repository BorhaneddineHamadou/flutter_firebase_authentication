import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationHelper{
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static get user => _auth.currentUser;

  static Future<String?> signUp({required String email, required String password}) async{
    try{
      final userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        // User successfully registered
        return null;
      } else {
        // Handle the case where userCredential.user is null (registration failed)
        return 'Registration failed. Please try again later.';
      }
    }on FirebaseAuthException catch(e){
      return e.message;
    }
  }

  static Future<String?> signIn({required String email, required String password}) async{
    try{
      final userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        // User successfully signed in
        return null;
      } else {
        // Handle the case where userCredential.user is null (sign-in failed)
        return 'Sign-in failed. Please check your credentials.';
      }
    }on FirebaseAuthException catch(e){
      return e.message;
    }
  }

  static Future<void> signOut() async {
    await _auth.signOut();
  }
}