import 'dart:developer';

import 'package:emori/model/user/register_user.dart';
import 'package:emori/screens/auth_screens/gender_screen.dart';
import 'package:emori/utilities/constants/text_constants/auth_constants.dart';
import 'package:emori/utilities/utils/picker_utils.dart';
import 'package:emori/utilities/widgets/auth_widgets/selector_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BirthDatePickerScreen extends StatefulWidget {
  final RegisterUser registerUser;
  const BirthDatePickerScreen(this.registerUser, {Key? key}) : super(key: key);

  @override
  _DatePickerPageState createState() => _DatePickerPageState();
}

class _DatePickerPageState extends State<BirthDatePickerScreen> {
  late RegisterUser registerUser = widget.registerUser;
  final dateFormat = DateFormat('dd/MM/yyyy');

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
                    children: [
                      kInputTextHeading(
                          'Ievadi savi\ndzimšanas\ndatumu', kActiveYellow, 32)
                    ],
                  ),
                ),
                kSizedBox(60.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    kDescriptionText(registerUser.birthDate, kActiveYellow, 22)
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
                              registerUser.birthDate);
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
          maximumYear: DateTime.now().year,
          minimumYear: 1900,
          initialDateTime: DateTime.now(),
          mode: CupertinoDatePickerMode.date,
          onDateTimeChanged: (dateTime) => setState(
            () => registerUser.birthDate = dateFormat.format(dateTime),
          ),
        ),
      );
}
