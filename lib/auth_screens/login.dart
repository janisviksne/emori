import 'dart:convert';

import 'package:emori/auth_screens/register.dart';
import 'package:emori/auth_screens/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dashboard.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  User user = User("", "");
  String url = "http://192.168.8.118:8080/login";

  Future save() async {
    var res = await http.post(Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'email': user.email, 'password': user.password}));
    print(res.body);
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
                        image: AssetImage(
                            "images/auth_backgrounds/login_background.png"),
                        fit: BoxFit.cover),
                    color: Color.fromRGBO(248, 241, 214, 1),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          color: Colors.black,
                          offset: Offset(1, 5))
                    ],
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(80),
                        bottomRight: Radius.circular(20)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 100,
                        ),
                        const Text(
                          "Login",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Email",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: TextEditingController(text: user.email),
                          onChanged: (val) {
                            user.email = val;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Password is Empty';
                            }
                            return null;
                          },
                          style: const TextStyle(
                              fontSize: 20, color: Colors.black),
                          decoration: const InputDecoration(
                              errorStyle:
                                  TextStyle(fontSize: 20, color: Colors.black),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none)),
                        ),
                        Container(
                          height: 8,
                          color: Colors.black,
                        ),
                        const SizedBox(
                          height: 60,
                        ),
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Password",
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.black,
                            ),
                            // fontWeight: FontWeight.bold,
                          ),
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
                              return 'Email is Empty';
                            }
                            return null;
                          },
                          style: const TextStyle(
                              fontSize: 30, color: Colors.black),
                          decoration: const InputDecoration(
                              errorStyle:
                                  TextStyle(fontSize: 20, color: Colors.black),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none)),
                        ),
                        Container(
                          height: 8,
                          color: Colors.black,
                        ),
                        const SizedBox(
                          height: 60,
                        ),
                        Center(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Register()));
                            },
                            child: const Text(
                              "Dont have Account ?",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  height: 90,
                  width: 90,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.black),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          save();
                        }
                      },
                      child: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 30,
                      )),
                )
              ],
            )),
      ),
    );
  }
}
