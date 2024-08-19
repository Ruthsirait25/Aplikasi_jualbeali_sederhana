import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();
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
                "asset/img/flutter.png",
                height: 100,
                width: 100,
              ),
            ),
            Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: "Username"),
                )),
            Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: PasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: "Password"),
                )),
            TextButton(
              onPressed: () {},
              child: Text("Forget Password"),
            ),
            Container(
              height: 50,
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                style: raisedButtonStyle,
                child: Text("Login"),
                onPressed: () {},
              ),
            ),
            Container(
                child: Row(children: <Widget>[
              Text("          Does not Have Account "),
              TextButton(
                  child: Text("Sign In", style: TextStyle(fontSize: 16)),
                  onPressed: () {})
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
