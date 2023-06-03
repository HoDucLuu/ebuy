import 'package:ebuy/screens/home/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ebuy/screens/auth_ui/welcome/welcome.dart';
import 'package:ebuy/constants/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    appId: "1:399301934857:android:e26094eb429ee906fe1dd8",
    apiKey: "AIzaSyBd4j852hdT5WBvP7oo6Z1PbR0ea-dBuGQ",
    projectId: "ebuy-83768",
    messagingSenderId: "399301934857",
  )
      //DefaultFireBaseConfig.platformOption,
      );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EBuy',
      theme: themeData,
      home: const Welcome(),
    );
  }
}
