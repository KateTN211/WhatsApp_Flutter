import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:whatsapp_clone/common/utils/show_snack_bar.dart';
import 'package:whatsapp_clone/features/auth/screens/in/home_screen.dart';

class FirebaseAuthMethods {
  final FirebaseAuth _auth;
  FirebaseAuthMethods(this._auth);

  //signup email
  Future<void> signUpWithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (context.mounted) {
        await sendEmailVerification(context);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password' && context.mounted) {
        showSnackBar(context, 'You gave a weak password');
      }
      if (context.mounted) {
        showSnackBar(context, e.message!);
      }
    }
  }

//email verification
  Future<void> sendEmailVerification(BuildContext context) async {
    try {
      _auth.currentUser!.sendEmailVerification();
      showSnackBar(context, 'Email verification sent!');
    } on FirebaseAuthException catch (e) {
      if (context.mounted) {
        showSnackBar(context, e.message!);
      }
    }
  }

  //email signin
  Future<void> loginWithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      if (!_auth.currentUser!.emailVerified) {
        if (context.mounted) {
          await sendEmailVerification(context);
          if (context.mounted) {
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Please verify your email!'),
                ),
              );
            }
          }
        }
      } else {
        if (context.mounted) {
          Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
        }
      }
    } on FirebaseAuthException catch (e) {
      if (context.mounted) {
        showSnackBar(context, e.message!);
      }
    }
  }
}
