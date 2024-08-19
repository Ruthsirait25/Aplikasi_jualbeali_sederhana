import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:tugas10/Tugas11/HomeScreen.dart';
import 'package:tugas10/Tugas11/gridview_component.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tugas10/Tugas11/register_screen.dart';
import 'package:tugas10/Tugas11/utils/snack_bar.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  TextEditingController nameController = TextEditingController();

  var loading = false;

  _resetPassword() async {
    try {
      setState(() => loading = true);
      final credential = await FirebaseAuth.instance.sendPasswordResetEmail(
        email: nameController.text,
      );
      showSnackBar(context, 'link reset password sent successfully');
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
              height: 50,
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: loading
                  ? Center(child: CircularProgressIndicator())
                  : ElevatedButton(
                      style: raisedButtonStyle,
                      child: Text("Reset Password"),
                      onPressed: () {
                        _resetPassword();
                      },
                    ),
            ),
            Container(
                child: Row(children: <Widget>[
              Text("          Does not Have Account?"),
              TextButton(
                  child: Text("Register", style: TextStyle(fontSize: 16)),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (c) => RegisterScreen()));
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
