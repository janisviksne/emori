import 'dart:convert';

import 'package:emori/auth_screens/user.dart';
import 'package:emori/utilities/constants.dart';
import 'package:emori/utilities/widgets/input_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  User user = User("", "");
  String url = "http://localhost:8080/register";

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
                    color: kBackgroundColor,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        color: Colors.black,
                        offset: Offset(1, 5),
                      )
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 100,
                        ),
                        const Text("Reģistrācija", style: kInputTextStyle),
                        const SizedBox(
                          height: 30,
                        ),
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Text("E-pasts", style: kInputTextStyle),
                        ),
                        InputFieldWidget(
                          inputValue: user.email,
                          fieldName: 'E-pasta',
                          isObscureText: true,
                        ),
                        Container(
                          height: 2,
                          color: kActiveGreen,
                        ),
                        const SizedBox(
                          height: 60,
                        ),
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Text("Password", style: kInputTextStyle),
                        ),
                        InputFieldWidget(
                          inputValue: user.password,
                          fieldName: 'Paroles',
                          isObscureText: true,
                        ),
                        Container(
                          height: 2,
                          color: kActiveGreen,
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
            )),
      ),
    );
  }
}
