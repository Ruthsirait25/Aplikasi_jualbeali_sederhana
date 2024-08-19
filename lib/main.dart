import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas10/Tugas11/root_screen.dart';
// import 'Tugas10/HomeScreen.dart';
import 'Tugas11/HomeScreen.dart';
import 'Tugas11/LoginScreen.dart';
import 'firebase_options.dart';
// import 'package:tugas10/Tugas/HomeScreen.dart';
// import 'package:tugas10/Tugas/LoginScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'MyApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RootScreen(),
    );
  }
}
