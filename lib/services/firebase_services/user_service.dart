
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';



class UserService {

  Future<void> getUserDetails(String username, String phoneNumber, File userProfileImage)async {
  final user = FirebaseAuth.instance.currentUser;
 
  try {
    if(user == null) throw Exception("user cannot be empty");
      final userid = user.uid;
    final imageRef = FirebaseStorage.instance.ref("images").child(userid).child("${DateTime.now().millisecondsSinceEpoch}");
    final imageUpload  = imageRef.putFile(userProfileImage);
    final snapshot = await imageUpload;
    final imageUrl = snapshot.ref.getDownloadURL();
    
    await FirebaseFirestore.instance.collection("user_details").add( {
      "username" : username, 
      "userId" : FirebaseAuth.instance.currentUser?.uid,
      "phone_number" : phoneNumber, 
      "imageUrl" : imageUrl
    });
  } catch (e) {
    debugPrint("error: $e");
  }

}
  
}