import 'package:flutter/material.dart';
import 'package:tugas10/Tugas11/HomeScreen.dart';
import 'package:tugas10/Tugas11/LoginScreen.dart';
import 'package:tugas10/Tugas11/gridview_component.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tugas10/Tugas11/utils/snack_bar.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();
  TextEditingController password2Controller = TextEditingController();

  var loading = false;

  _register() async {
    if (PasswordController.text != password2Controller.text) {
      showSnackBar(context, 'password tidak sesuai');
      return;
    }
    try {
      setState(() => loading = true);
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: nameController.text,
        password: PasswordController.text,
      );
      showSnackBar(context, 'Berhasil register');
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
         showSnackBar(context, 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
         showSnackBar(context, 'The account already exists for that email.');
      } else {
        showSnackBar(context, '$e');
      }
    } catch (e) {
       showSnackBar(context, '$e');
    }
    setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                margin: const EdgeInsets.only(top: 40),
                child: Text(
                  "Sanber Flutter",
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                "assets/img/flutter.png",
                height: 100,
                width: 100,
              ),
            ),
            Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: "email"),
                )),
            Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: PasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: "Password"),
                )),
            Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: password2Controller,
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Konfirmasi password"),
                )),
            Container(
              height: 50,
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: loading
                  ? Center(child: CircularProgressIndicator())
                  : ElevatedButton(
                      style: raisedButtonStyle,
                      child: Text("Register"),
                      onPressed: () {
                        _register();
                      },
                    ),
            ),
            Container(
                child: Row(children: <Widget>[
              Text("          Already Have Account?"),
              TextButton(
                  child: Text("Sign In", style: TextStyle(fontSize: 16)),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (c) => LoginScreen(HomeScreen())),
                        (route) => false);
                  })
            ]))
          ],
        ),
      ),
    );
  }
}

final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  onPrimary: Colors.grey[300],
  primary: Colors.blue[300],
  minimumSize: Size(88, 36),
  padding: EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(6)),
  ),
);
