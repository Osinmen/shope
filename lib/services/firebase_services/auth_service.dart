import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  //create account logic

  Future<void> createUserwithEmailandPassword(
    String email,
    String password,
  ) async {
    try {
      final UserCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print("this is not working ${e.message}");
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
   } on FirebaseAuthException catch(e) {
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
