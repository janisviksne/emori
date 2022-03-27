import 'dart:convert';
import 'dart:developer';

import 'package:emori/auth_screens/register.dart';
import 'package:emori/auth_screens/user.dart';
import 'package:emori/utilities/auth_constants.dart';
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
  User user = User("", "");
  String url = "http://10.0.2.2:8080/login";

  Future save() async {
    var res = await http.post(Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'email': user.email, 'password': user.password}));
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
      body: SingleChildScrollView(
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  height: 750,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        alignment: Alignment(1.7, -0.98),
                        image: AssetImage(
                            "images/auth_backgrounds/login_page_top.png")),
                    color: kActiveYellow,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        kSizedBox(80.0),
                        kInputTextHeading('Ienāc savā kontā', kActiveGreen, 24),
                        kSizedBox(10.0),
                        Align(
                          alignment: Alignment.topLeft,
                          child: kInputTextHeading('E-pasts', kActiveGreen, 24),
                        ),
                        TextFormField(
                          obscureText: false,
                          controller: TextEditingController(text: user.email),
                          onChanged: (val) {
                            user.email = val;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'E-pasta lauks ir tukšs!';
                            }
                          },
                          style: const TextStyle(
                              fontSize: 20, color: kActiveGreen),
                          decoration: const InputDecoration(
                              errorStyle:
                                  TextStyle(fontSize: 20, color: Colors.red),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none)),
                        ),
                        Container(
                          height: 2,
                          color: kActiveGreen,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: kInputTextHeading('Parole', kActiveGreen, 24),
                        ),
                        TextFormField(
                          obscureText: true,
                          controller:
                              TextEditingController(text: user.password),
                          onChanged: (val) {
                            user.password = val;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Paroles lauks ir tukšs!';
                            }
                          },
                          style: const TextStyle(
                              fontSize: 20, color: kActiveGreen),
                          decoration: const InputDecoration(
                              errorStyle:
                                  TextStyle(fontSize: 20, color: Colors.red),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none)),
                        ),
                        Container(
                          height: 2,
                          color: kActiveGreen,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Center(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Register()));
                            },
                            child: const Text(
                              "Izveidot kontu",
                              style: kInputFieldUnderline,
                            ),
                          ),
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.only(top: 20.0),
                                width: 90.0,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: kActiveGreen),
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      save();
                                    }
                                  },
                                  child: const Icon(
                                    Icons.arrow_forward,
                                    size: 30,
                                  ),
                                ),
                              ),
                            ]),
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
