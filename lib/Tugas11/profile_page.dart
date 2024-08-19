import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas10/Tugas11/HomeScreen.dart';
import 'package:tugas10/Tugas11/LoginScreen.dart';

class CartProfile extends StatelessWidget {
  const CartProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 22, 94, 202),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage('assets/img/foto.png'),
                ),
                const Text(
                  'Ruth Sirait',
                  style: TextStyle(
                      fontFamily: 'YsabeauInfant',
                      fontSize: 40.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'Flutter Developer',
                  style: TextStyle(
                      fontFamily: 'Vollkorn',
                      color: Colors.teal.shade100,
                      fontSize: 30.0,
                      letterSpacing: 3.5,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20.0,
                  width: 150.0,
                  child: Divider(
                    color: Colors.teal.shade100,
                  ),
                ),
                Card(
                  margin: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    leading: const Icon(
                      Icons.phone,
                      color: Color.fromARGB(255, 15, 12, 209),
                    ),
                    title: Text(
                      '+62 8126 4086 157',
                      style: TextStyle(
                          color: Colors.teal.shade100,
                          fontFamily: 'Vollkorn',
                          fontSize: 20.0),
                    ),
                  ),
                ),
                Card(
                  margin: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 25.0,
                  ),
                  child: ListTile(
                    leading: const Icon(
                      Icons.email,
                      color: Colors.teal,
                    ),
                    title: Text(
                      'ruthsirait24@gmail.com',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.teal.shade900,
                          fontFamily: 'Vollkorn'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: Get.width,
                    child: ElevatedButton(
                      onPressed: () {
                        FirebaseAuth.instance.signOut();
                        Get.offAll(const LoginScreen(HomeScreen()));
                      },
                      child: const Text('Logout'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
