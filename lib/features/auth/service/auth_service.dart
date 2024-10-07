import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationProvider extends ChangeNotifier {
  UserCredential? _userCredential;
  UserCredential? get userCredential => _userCredential;

  Future<bool> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    _userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    notifyListeners();
    if (_userCredential != null && _userCredential!.user != null) {
      log(_userCredential!.user!.displayName!);
      return true;
    } else {
      return false;
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
    _userCredential = null;
    notifyListeners();
  }

  bool checkSignin() {
    final GoogleSignInAccount? googleUser = GoogleSignIn().currentUser;
    if (googleUser != null) {
      return true;
    }
    return false;
  }
}
