import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

@singleton
class AuthCubit {
  Future<String?> load() async {
    if (FirebaseAuth.instance.currentUser != null) return FirebaseAuth.instance.currentUser!.uid;
    return null;
  }

  Future<void> googleAuth() async {
    try {
      final UserCredential? user = await _signInWithGoogle();
      if (user != null) print(user.user!.uid);
    } catch (e) {
      print('SignInFailed $e');
    }
  }

  Future<bool> signOutFromGoogle() async {
    try {
      await FirebaseAuth.instance.signOut();
      return true;
    } on Exception catch (_) {
      return false;
    }
  }

  Future<UserCredential?> _signInWithGoogle() async {
    try {
      await InternetAddress.lookup('google.com');
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      print('SignInFailed $e');
      throw Exception('SignInFailed $e');
    }
  }
}
