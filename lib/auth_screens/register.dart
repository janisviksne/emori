import 'dart:convert';
import 'dart:developer';

import 'package:emori/auth_screens/register_user.dart';
import 'package:emori/auth_screens/username_screen.dart';
import 'package:emori/utilities/auth_constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();

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
      resizeToAvoidBottomInset: false,
      backgroundColor: kActiveYellow,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    iconSize: 50.0,
                    onPressed: () {
                      Navigator.pop(context);
                      log('Returning to login screen');
                    },
                    icon: const Icon(Icons.arrow_back),
                    color: kActiveGreen,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  kInputTextHeading('Izveido\nsavu kontu', kActiveGreen, 40)
                ],
              ),
              kSizedBox(20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'Vai Tev jau ir izveidots konts? ',
                    style: TextStyle(color: kActiveGreen, fontSize: 20),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Ienākt',
                      style: kInputFieldUnderline,
                    ),
                  ),
                ],
              ),
              kSizedBox(20.0),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextFormField(
                      obscureText: false,
                      controller:
                          TextEditingController(text: registerUser.password),
                      onChanged: (val) {
                        registerUser.password = val;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Šis lauks nedrīkst būt tukšs!';
                        } else if (registerUser.password != value) {
                          return 'Ievadītās paroles nesakrīt!';
                        }
                      },
                      style: const TextStyle(fontSize: 20, color: kActiveGreen),
                      decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: kActiveGreen),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: kActiveGreen),
                          ),
                          hintStyle: TextStyle(
                              color: kActiveGreen, fontWeight: FontWeight.bold),
                          hintText: 'E-pasts',
                          errorStyle:
                              TextStyle(fontSize: 20, color: Colors.red),
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none)),
                    ),
                    kSizedBox(20.0),
                    TextFormField(
                      obscureText: true,
                      controller:
                          //ToDo make sure that both fields can actually use same field, maybe only use in second pass
                          TextEditingController(text: registerUser.password),
                      onChanged: (val) {
                        registerUser.password = val;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Šis lauks nedrīkst būt tukšs!';
                        } else if (registerUser.password != value) {
                          return 'Ievadītās paroles nesakrīt!';
                        }
                      },
                      style: const TextStyle(fontSize: 20, color: kActiveGreen),
                      decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: kActiveGreen),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: kActiveGreen),
                          ),
                          hintStyle: TextStyle(
                              color: kActiveGreen, fontWeight: FontWeight.bold),
                          hintText: 'Parole',
                          errorStyle:
                              TextStyle(fontSize: 20, color: Colors.red),
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none)),
                    ),
                    kSizedBox(20.0),
                    TextFormField(
                      textAlign: TextAlign.left,
                      obscureText: true,
                      controller:
                          TextEditingController(text: registerUser.password),
                      onChanged: (val) {
                        registerUser.password = val;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Šis lauks nedrīkst būt tukšs!';
                        } else if (registerUser.password != value) {
                          return 'Ievadītās paroles nesakrīt!';
                        }
                      },
                      style: const TextStyle(fontSize: 20, color: kActiveGreen),
                      decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: kActiveGreen),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: kActiveGreen),
                          ),
                          hintText: 'Parole atkārtoti',
                          hintStyle: TextStyle(
                              color: kActiveGreen, fontWeight: FontWeight.bold),
                          errorStyle:
                              TextStyle(fontSize: 20, color: Colors.red),
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none)),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(
                      iconSize: 50.0,
                      onPressed: () {
                        // if (_formKey.currentState!.validate()) {
                        log('Moving to date picker screen');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UsernameScreen()));
                        // }
                      },
                      icon: const Icon(Icons.arrow_forward),
                      color: kActiveGreen,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
