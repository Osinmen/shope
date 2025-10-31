import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shope/home_screen.dart';
import 'package:shope/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shope/providers/image_provider.dart';
import 'package:shope/screens/auth/create_account.dart';
import 'package:shope/screens/auth/login.dart';
import 'package:shope/screens/home/full_profile.dart';
import 'package:shope/screens/home/hello_screen.dart';
import 'package:shope/screens/home/ready_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserImageProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const FullProfile(),
    );
  }
}

//
