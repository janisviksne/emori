import 'dart:convert';

import 'package:emori/auth_screens/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
  //const Register({required Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  User user = User("", "");
  String url = "http://192.168.8.118:8080/register";

  Future save() async {
    var res = await http.post(Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'email': user.email, 'password': user.password}));
    print(res.body);
    Navigator.pop(context);
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
                            "images/auth_backgrounds/registration_background.png"),
                        fit: BoxFit.scaleDown),
                    color: Color.fromRGBO(248, 241, 214, 1),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        color: Colors.black,
                        offset: Offset(1, 5),
                      )
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
                          "Register",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
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
                          height: 2,
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
                              fontSize: 40,
                              color: Colors.black,
                            ),
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
                              fontSize: 30, color: Colors.white),
                          decoration: const InputDecoration(
                              errorStyle:
                                  TextStyle(fontSize: 20, color: Colors.black),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none)),
                        ),
                        Container(
                          height: 2,
                          color: Colors.black,
                        ),
                        const SizedBox(
                          height: 60,
                        ),
                        Center(
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              "Already have Account ?",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
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
                  child: FlatButton(
                      color: const Color.fromRGBO(233, 65, 82, 1),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          save();
                        }
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
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
