import 'dart:convert';
import 'dart:developer';

import 'package:emori/auth_screens/email_password_screen.dart';
import 'package:emori/user_constructors/user.dart';
import 'package:emori/utilities/auth_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dashboard.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  //ToDo add another constructor. 1st for login, 2nd for register
  LoginUser loginUser = LoginUser("", "");
  String url = "http://10.0.2.2:8080/login";

  Future login() async {
    var res = await http.post(Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(
            {'email': loginUser.email, 'password': loginUser.password}));
    log(res.body);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Dashboard(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kActiveYellow,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      kInputTextHeading('Ienāc\nsavā kontā', kActiveGreen, 40),
                    ],
                  ),
                  kSizedBox(20.0),
                  Row(
                    children: [
                      kDescriptionText('Ievadi savus esošos pieejas datus',
                          kActiveGreen, 18),
                    ],
                  ),
                  kSizedBox(20.0),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          obscureText: false,
                          controller:
                              TextEditingController(text: loginUser.email),
                          onChanged: (val) {
                            loginUser.email = val;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Šis lauks nedrīkst būt tukšs!';
                            }
                          },
                          style: const TextStyle(
                              fontSize: 20, color: kActiveGreen),
                          decoration: kInputFieldDecoration('E-pasts'),
                        ),
                        kSizedBox(20.0),
                        TextFormField(
                          obscureText: true,
                          controller:
                              TextEditingController(text: loginUser.password),
                          onChanged: (val) {
                            loginUser.password = val;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Šis lauks nedrīkst būt tukšs!';
                            }
                          },
                          style: const TextStyle(
                              fontSize: 20, color: kActiveGreen),
                          decoration: kInputFieldDecoration('Parole'),
                        ),
                      ],
                    ),
                  ),
                  kSizedBox(20.0),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          log('Redirect to forgot password.');
                        },
                        child: const Text(
                          'Aizmirsi paroli?',
                          style: kInputFieldUnderline,
                        ),
                      ),
                    ],
                  ),
                  kSizedBox(20.0),
                  Row(
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: kActiveGreen,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 12),
                              textStyle: const TextStyle(
                                  fontSize: 16, color: kActiveYellow)),
                          child: const Text('Ienākt'),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              login();
                            }
                          })
                    ],
                  ),
                  kSizedBox(20.0),
                  Row(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: kActiveGreen,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 12),
                            textStyle: const TextStyle(
                                fontSize: 16, color: kActiveYellow)),
                        child: const Text('Reģistrējies'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const EmailPasswordScreen()));
                        },
                      )
                    ],
                  ),
                ],
              ),
            ),
            //ToDo THE LOGIN SCREEN IMAGE WILL GO HERE
          ],
        ),
      ),
    );
  }
}
