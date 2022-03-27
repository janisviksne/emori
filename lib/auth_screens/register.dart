import 'dart:convert';
import 'dart:developer';

import 'package:emori/auth_screens/register_user.dart';
import 'package:emori/auth_screens/username_screen.dart';
import 'package:emori/utilities/auth_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  //User user = User("", "");
  DateTime defaultDate = DateTime.now();

  RegisterUser registerUser = RegisterUser(
      "", "", "", DateTime.now(), "", "", List.empty(growable: true), false);
  String url = "http://10.0.2.2:8080/register";

  Future save() async {
    var res = await http.post(Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(
            {'email': registerUser.email, 'password': registerUser.password}));
    log(res.body);
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
                // decoration: const BoxDecoration(
                //   image: DecorationImage(
                //       image: AssetImage(""), fit: BoxFit.scaleDown),
                color: kActiveYellow,
                //   boxShadow: [
                //     BoxShadow(
                //       blurRadius: 10,
                //       color: Colors.black,
                //       offset: Offset(1, 5),
                //     )
                //   ],
                // ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      kSizedBox(50),
                      kInputTextHeading('Izveido savu kontu', kActiveGreen, 24),
                      kSizedBox(10),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Vai Tev jau ir izveidots konts ?",
                          style: kInputFieldUnderline,
                        ),
                      ),
                      kSizedBox(20),
                      Align(
                          alignment: Alignment.topLeft,
                          child:
                              kInputTextHeading('E-pasts', kActiveGreen, 24)),
                      TextFormField(
                        obscureText: false,
                        controller:
                            TextEditingController(text: registerUser.email),
                        onChanged: (val) {
                          registerUser.email = val;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'E-pasta lauks ir tukšs!';
                          }
                        },
                        style:
                            const TextStyle(fontSize: 20, color: kActiveGreen),
                        decoration: const InputDecoration(
                            errorStyle:
                                TextStyle(fontSize: 20, color: Colors.red),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none)),
                      ),
                      kInputFormLine(kActiveGreen),
                      kSizedBox(10),
                      Align(
                        alignment: Alignment.topLeft,
                        child: kInputTextHeading('Parole', kActiveGreen, 24),
                      ),
                      TextFormField(
                        obscureText: true,
                        controller:
                            TextEditingController(text: registerUser.password),
                        onChanged: (val) {
                          registerUser.password = val;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Paroles lauks ir tukšs!';
                          }
                        },
                        style:
                            const TextStyle(fontSize: 20, color: kActiveGreen),
                        decoration: const InputDecoration(
                            errorStyle:
                                TextStyle(fontSize: 20, color: Colors.red),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none)),
                      ),
                      kInputFormLine(kActiveGreen),
                      kSizedBox(20),
                      //nickname field
                      Align(
                        alignment: Alignment.topLeft,
                        child: kInputTextHeading(
                            'Parole atkārtoti', kActiveGreen, 24),
                      ),
                      TextFormField(
                        obscureText: true,
                        controller:
                            TextEditingController(text: registerUser.nickname),
                        onChanged: (val) {
                          registerUser.nickname = val;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Ievadītais lauks nedrīkst būt tukšs'; //return, cuz shows up on screen
                          } else if (value != registerUser.password) {
                            return 'Ievadītā parole nesakrīt';
                          }
                        },
                        style:
                            const TextStyle(fontSize: 20, color: kActiveGreen),
                        decoration: const InputDecoration(
                            errorStyle:
                                TextStyle(fontSize: 20, color: Colors.red),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none)),
                      ),
                      kInputFormLine(kActiveGreen),
                      Container(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: IconButton(
                          iconSize: 60.0,
                          onPressed: () {
                            // if (_formKey.currentState!.validate()) {
                            log('Moving to username input screen');
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => UsernameScreen()));
                            // }
                          },
                          icon: const Icon(Icons.arrow_forward),
                          color: kActiveGreen,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
