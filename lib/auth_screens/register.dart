import 'dart:convert';

import 'package:emori/auth_screens/register_user.dart';
import 'package:emori/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
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
                // decoration: const BoxDecoration(
                //   image: DecorationImage(
                //       image: AssetImage(""), fit: BoxFit.scaleDown),
                color: kBackgroundColor,
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
                      kInputTextHeading('Reģistrācija', Colors.black),
                      kSizedBox(10),
                      Align(
                          alignment: Alignment.topLeft,
                          child: kInputTextHeading('E-pasts', kActiveGreen)),
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
                      kInputFormLine(),
                      kSizedBox(10),
                      Align(
                        alignment: Alignment.topLeft,
                        child: kInputTextHeading('Parole', kActiveGreen),
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
                      kInputFormLine(),
                      kSizedBox(20),
                      //nickname field
                      Align(
                        alignment: Alignment.topLeft,
                        child: kInputTextHeading('Lietotājvārds', kActiveGreen),
                      ),
                      TextFormField(
                        obscureText: false,
                        controller:
                            TextEditingController(text: registerUser.nickname),
                        onChanged: (val) {
                          registerUser.nickname = val;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Ievadiet lietotājvārdu!';
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
                      kInputFormLine(),
                      kSizedBox(20),
                      Column(
                        children: [
                          Row(
                            children: [
                              Column(
                                children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: kInputTextHeading(
                                        'Dzimšanas datums', kActiveGreen),
                                  ),
                                  Text(
                                    '${defaultDate.day}-${defaultDate.month}-${defaultDate.year}',
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                  ElevatedButton(
                                    child: const Text('Izvēlies datumu'),
                                    onPressed: () async {
                                      defaultDate = (await showDatePicker(
                                          context: context,
                                          initialDate: defaultDate,
                                          firstDate: DateTime(1900),
                                          lastDate: DateTime(3000)))!;

                                      setState(() =>
                                          registerUser.birthdate = defaultDate);
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      kSizedBox(20),
                      Center(
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "Esi jau reģistrējies ?",
                            style: kInputFieldUnderline,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: ElevatedButton(
                          style:
                              ElevatedButton.styleFrom(primary: kActiveGreen),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              save();
                            }
                          },
                          child: const Text('Reģistrēties'),
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
