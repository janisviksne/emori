import 'dart:developer';

import 'package:emori/user_constructors/register_user.dart';
import 'package:emori/utilities/auth_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'date_picker_screen.dart';

class UsernameScreen extends StatefulWidget {
  final RegisterUser registerUser;
  const UsernameScreen(this.registerUser, {Key? key}) : super(key: key);

  @override
  _UsernameState createState() => _UsernameState();
}

//ToDo Pass username to end screen
class _UsernameState extends State<UsernameScreen> {
  String url = "http://10.0.2.2:8080/submitNickname";

  late RegisterUser registerUser = widget.registerUser;
  // Future submitUsername() async {
  //   print(registerUser.nickname);
  //   var res = await http.post(Uri.parse(url),
  //       headers: {'Content-Type': 'application/json'},
  //       body: json.encode({
  //         'email': registerUser.email,
  //         'password': registerUser.password,
  //         'nickname': registerUser.nickname
  //       }));
  //   log(res.body);
  // }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: kActiveGreen,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      iconSize: 50.0,
                      onPressed: () {
                        Navigator.pop(context);
                        log('Returning to e-mail/password input screen');
                      },
                      icon: const Icon(Icons.arrow_back),
                      color: kActiveYellow,
                    ),
                  ],
                ),
                kSizedBox(15.0),
                Row(
                  children: const [
                    Text(
                      'Kā Tevi uzrunāt?',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: kActiveYellow,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                kSizedBox(15.0),
                Row(
                  children: const [
                    Text(
                      'Ieraksti vārdu, kurā vēlies, lai lietotne\nTevi uzrunā dažādās sadaļās.',
                      style: TextStyle(color: kActiveYellow, fontSize: 20),
                    )
                  ],
                ),
                kSizedBox(15.0),
                Form(
                    child: Column(
                      children: [
                        TextFormField(
                          obscureText: false,
                          controller: TextEditingController(
                              text: registerUser.nickname),
                          onChanged: (val) {
                            registerUser.nickname = val;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Ievadītais lauks nedrīkst būt tukšs!';
                            }
                          },
                          style: const TextStyle(
                              fontSize: 20, color: kActiveYellow),
                          decoration: const InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: kActiveYellow),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: kActiveYellow),
                              ),
                              hintText: 'Uzruna/ vārds',
                              hintStyle: TextStyle(color: kActiveYellow),
                              errorStyle:
                                  TextStyle(fontSize: 20, color: Colors.red),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none)),
                        ),
                      ],
                    ),
                    key: _formKey),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      IconButton(
                        iconSize: 50.0,
                        onPressed: () {
                          print(registerUser.email +
                              ' | ' +
                              registerUser.password +
                              ' | ' +
                              registerUser.nickname);
                          // if (_formKey.currentState!.validate()) {

                          log('Moving to date picker screen');
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BirthDatePickerScreen(registerUser)));
                          // }
                        },
                        icon: const Icon(Icons.arrow_forward),
                        color: kActiveYellow,
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
