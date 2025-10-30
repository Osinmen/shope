import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class UserService {
  Future<void> getUserDetails(
      String username, String phoneNumber) async {
    final user = FirebaseAuth.instance.currentUser;

    try {
      if (user == null) throw Exception("User cannot be null");

      final userId = user.uid;

    
      // Save user details to Firestore
      await FirebaseFirestore.instance.collection("user_details").doc(userId).set({
        "username": username,
        "userId": userId,
        "phone_number": phoneNumber,
        "createdAt": FieldValue.serverTimestamp(),
      });

      debugPrint("User details uploaded successfully!");
    } catch (e) {
      debugPrint("❌ Error uploading user details: $e");
    }
  }
}
