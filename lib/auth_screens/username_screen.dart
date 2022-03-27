import 'dart:developer';

import 'package:emori/utilities/auth_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'date_picker_screen.dart';

class UsernameScreen extends StatefulWidget {
  @override
  _UsernameState createState() => _UsernameState();
}

//ToDo Pass username to end screen
class _UsernameState extends State<UsernameScreen> {
  String tempNickName = ''; //this value represents the input
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: kActiveGreen,
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
                        log('Returning to e-mail/password input screen');
                      },
                      icon: const Icon(Icons.arrow_back),
                      color: kActiveYellow,
                    ),
                  ],
                ),
                kSizedBox(20.0),
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
                kSizedBox(20.0),
                Row(
                  children: const [
                    Text(
                      'Ieraksti vārdu, kurā vēlies, lai lietotne\nTevi uzrunā dažādās sadaļās.',
                      style: TextStyle(color: kActiveYellow, fontSize: 20),
                    )
                  ],
                ),
                kSizedBox(20.0),
                TextFormField(
                  obscureText: false,
                  controller: TextEditingController(text: tempNickName),
                  onChanged: (val) {
                    tempNickName = val;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Ievadītais lauks nedrīkst būt tukšs!';
                    }
                  },
                  style: const TextStyle(fontSize: 20, color: kActiveYellow),
                  decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: kActiveYellow),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: kActiveYellow),
                      ),
                      hintText: 'Uzruna/ vārds',
                      hintStyle: TextStyle(color: kActiveYellow),
                      errorStyle: TextStyle(fontSize: 20, color: Colors.red),
                      border: OutlineInputBorder(borderSide: BorderSide.none)),
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
                                  builder: (context) => BirthDatePicker()));
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
