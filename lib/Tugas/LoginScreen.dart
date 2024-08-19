import 'package:flutter/material.dart';
import 'package:tugas10/Tugas/HomeScreen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen(HomeScreen homeScreen);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          'Login Screen',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
