import 'dart:convert';
import 'dart:developer';

import 'package:emori/auth_screens/gender_screen.dart';
import 'package:emori/user_constructors/register_user.dart';
import 'package:emori/utilities/auth_constants.dart';
import 'package:emori/utilities/utils/picker_utils.dart';
import 'package:emori/utilities/widgets/auth_widgets/selector_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BirthDatePickerScreen extends StatefulWidget {
  final RegisterUser registerUser;
  const BirthDatePickerScreen(this.registerUser, {Key? key}) : super(key: key);

  @override
  _DatePickerPageState createState() => _DatePickerPageState();
}

class _DatePickerPageState extends State<BirthDatePickerScreen> {
  late RegisterUser registerUser = widget.registerUser;
  String url = "http://10.0.2.2:8080/submitNickname";
  //ToDo pass this dateTime value to the next end screen
  DateTime dateTime = DateTime.now();
  Future submitDate() async {
    var res = await http.post(Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'email': registerUser.email,
          'password': registerUser.password,
          'nickname': registerUser.nickname
        }));
    log(res.body);
  }

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
                        log('Returning to username input screen');
                      },
                      icon: const Icon(Icons.arrow_back),
                      color: kActiveYellow,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Row(
                    children: const [
                      Text(
                        'Izvēlies savu\ndzimšanas\ndatumu',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: kActiveYellow,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                kSizedBox(60.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${registerUser.birthdate.year}-${registerUser.birthdate.month}-${registerUser.birthdate.day}',
                      style:
                          const TextStyle(fontSize: 20, color: kActiveYellow),
                    ),
                  ],
                ),
                kSizedBox(15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 24),
                    ButtonWidget(
                        onClicked: () => PickerUtils.showPicker(context,
                            child: buildDatePicker(),
                            onClicked: () => Navigator.pop(context))),
                  ],
                ),
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
                              registerUser.nickname +
                              ' | ' +
                              registerUser.birthdate.toString());
                          // if (_formKey.currentState!.validate()) {
                          log('Moving to gender selection screen');
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      GenderScreen(registerUser)));
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

  Widget buildDatePicker() => SizedBox(
        height: 180,
        child: CupertinoDatePicker(
          maximumYear: dateTime.year,
          minimumYear: 1900,
          initialDateTime: dateTime,
          mode: CupertinoDatePickerMode.date,
          onDateTimeChanged: (dateTime) => setState(
            () => registerUser.birthdate = dateTime,
          ),
        ),
      );
}
