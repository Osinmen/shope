import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  //create account logic

  Future<void> createUserwithEmailandPassword(
    String email, String password,) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("firebase c all completed");
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        print("password is too weak ");
      } else if (e.code == "invalid-email") {
        print("email is invalid");
      }
    }
  }

  //login user account logic

  Future<void> loginUserWithEmailandPassword(
    String email,
    String password,
  ) async {
    try {
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }

  //log out logic
  Future<void> logoutUser() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      print("$e");
    }
  }
}
