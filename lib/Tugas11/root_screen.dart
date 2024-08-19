import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tugas10/Tugas11/HomeScreen.dart';
import 'package:tugas10/Tugas11/LoginScreen.dart';
import 'package:tugas10/Tugas11/bottom_nav.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  firebaseListen(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2));
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (c) => const LoginScreen(HomeScreen())),
          (route) => false,
        );
      } else {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (c) => const BottomNavigationBarExample()),
          (route) => false,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    firebaseListen(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Image.asset('assets/img/flutter.png')),
    );
  }
}
