// ignore: file_names
// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:eventour/Userinfo.dart';
import 'package:flutter/material.dart';
import 'package:sawo/sawo.dart';
import 'sheets.dart';
import 'dart:convert';
import 'Home.dart';
import 'package:lottie/lottie.dart';

var UserName, UserNum;
dynamic extraction;

class LoginScreen extends StatefulWidget {
  static const String id = 'Login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Sawo sawo = Sawo(
    apiKey: "e03f5d61-52a5-468a-aed0-4ce3be6e9b61",
    secretKey: "6169dfb3aaa97bd4878dce82rpwMl8Mk4zEh9qjOnlVkdqoB",
  );
  // user payload
  String user = "";

  void payloadCallback(context, payload) {
    if (payload == null || (payload is String && payload.length == 0)) {
      payload = "Login Failed :(";
    }
    setState(() {
      user = payload;
      // ignore: avoid_print, non_constant_identifier_names
      Map user_json = json.decode(user);
      extraction = user_json;
      var uid = user_json["user_id"];
      var email = user_json["identifier"];
      var identifier = user_json["identifier_type"];
      var vToken = user_json["verification_token"];
      var name = user_json["customFieldInputValues"]["Name"];
      var phone = user_json["customFieldInputValues"]["Phone Number"];
      UserName = user_json["customFieldInputValues"]["Name"];
      UserNum = user_json["customFieldInputValues"]["Phone Number"];
      final u = {
        UserFields.id: uid,
        UserFields.email_phone: email,
        UserFields.Identifier: identifier,
        UserFields.VerificationTken: vToken,
        UserFields.Name: name,
      };
      UserSheetsApi.insert([u]);
      Navigator.pushReplacementNamed(context, HomePage.id);
      // ignore: avoid_print
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Column(
                children: [
                  Container(
                    height: 150,
                    width: 1000,
                    child: Image.asset('images/logo.jpeg'),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(80),
                    ),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Text(
                    'Hey There,',
                    style: TextStyle(
                      // color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Sign in to Continue!!!',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 60,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.lightBlueAccent,
                    fixedSize: const Size(220, 40),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25))),
                onPressed: () {
                  sawo.signIn(
                    context: context,
                    identifierType: 'email',
                    callback: payloadCallback,
                  );
                },
                child: Text(
                  'Email Login',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.lightBlueAccent,
                    fixedSize: const Size(220, 40),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25))),
                onPressed: () {
                  sawo.signIn(
                    context: context,
                    identifierType: 'phone_number_sms',
                    callback: payloadCallback,
                  );
                },
                child: Text(
                  'Phone Login',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.bottomCenter,
                child: Lottie.network(
                    'https://assets10.lottiefiles.com/packages/lf20_jcikwtux.json',
                    height: 290,
                    width: 650),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
