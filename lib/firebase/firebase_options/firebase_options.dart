//cau hinh firebase
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';

class DefaultFireBaseConfig {
  static FirebaseOptions get platformOption {
    if (Platform.isIOS) {
      //ios macos
      return const FirebaseOptions(
        appId: "1:399301934857:ios:2765d38c393c9da4fe1dd8",
        apiKey: "AIzaSyAtAeRfSwWExYLLrn5o3jxAJVknoIaGWc8",
        projectId: "ebuy-83768",
        messagingSenderId: "399301934857",
        iosBundleId: "com.example.ebuy",
      );
    } else {
      //android
      return const FirebaseOptions(
        appId: "1:399301934857:android:e26094eb429ee906fe1dd8",
        apiKey: "AIzaSyBd4j852hdT5WBvP7oo6Z1PbR0ea-dBuGQ",
        projectId: "ebuy-83768",
        messagingSenderId: "399301934857",
      );
    }
  }
}
