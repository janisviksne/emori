import 'dart:convert';
import 'dart:convert' as convert;
import 'dart:developer';

import 'package:emori/request_model/user/login_user.dart';
import 'package:emori/screens/questionnaire_screens/questionnaire_a_intro.dart';
import 'package:emori/utilities/constants/endpoint_constants.dart';
import 'package:emori/utilities/constants/text_constants/text_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'email_password_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  LoginUser loginUser = LoginUser(0, "", "");

  Future login() async {
    var response = await http.post(Uri.parse(Endpoints.LOGIN_ENDPOINT),
        headers: {'Content-Type': 'application/json;charset=utf-8'},
        body: json.encode(
            {'email': loginUser.email, 'password': loginUser.password}));
    if (response.statusCode == 200) {
      log(response.statusCode.toString());
      log(response.body);
      loginUser.userId = await convert.jsonDecode(response.body);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QuestionnaireAIntroScreen(loginUser),
          ));
    } else {
      log(response.statusCode.toString());
    }
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
                      kInputTextHeading('Ienāc\nsavā kontā', kActiveGreen, 30),
                    ],
                  ),
                  kHeightSizedBox(20.0),
                  Row(
                    children: [
                      kDescriptionText('Ievadi savus esošos pieejas datus',
                          kActiveGreen, 16),
                    ],
                  ),
                  kHeightSizedBox(20.0),
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
                          decoration:
                              kInputFieldDecoration('E-pasts', kActiveGreen),
                        ),
                        kHeightSizedBox(20.0),
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
                          decoration:
                              kInputFieldDecoration('Parole', kActiveGreen),
                        ),
                      ],
                    ),
                  ),
                  kHeightSizedBox(20.0),
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
                  kHeightSizedBox(20.0),
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
                  kHeightSizedBox(20.0),
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
