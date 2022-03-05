import 'dart:convert';

import 'package:emori/auth_screens/register.dart';
import 'package:emori/auth_screens/user.dart';
import 'package:emori/utilities/constants.dart';
import 'package:emori/utilities/widgets/input_field_widget.dart';
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
  String url = "http://localhost:8080/login";

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
                        fit: BoxFit.scaleDown),
                    color: Color.fromRGBO(248, 241, 214, 1),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          color: Colors.black,
                          offset: Offset(1, 5))
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 100,
                        ),
                        const Text("Ienāc savā kontā", style: kInputTextStyle),
                        const SizedBox(
                          height: 30,
                        ),
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Text("E-pasts", style: kInputTextStyle),
                        ),
                        InputFieldWidget(
                          inputValue: user.email,
                          fieldName: 'E-pasta ',
                          isObscureText: false,
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
                          child: Text("Parole ", style: kInputTextStyle
                              // fontWeight: FontWeight.bold,
                              ),
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Register()));
                            },
                            child: const Text(
                              "Izveidot kontu",
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
                            child: const Text('Pieslēgties'),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
