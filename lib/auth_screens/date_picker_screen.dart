import 'dart:developer';

import 'package:emori/utilities/auth_constants.dart';
import 'package:emori/utilities/widgets/auth_widgets/date_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BirthDatePicker extends StatefulWidget {
  @override
  _DatePickerPageState createState() => _DatePickerPageState();
}

class _DatePickerPageState extends State<BirthDatePicker> {
  //ToDo pass this dateTime value to the next end screen
  DateTime dateTime = DateTime.now();

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
                        log('Returning to username input screen');
                      },
                      icon: const Icon(Icons.arrow_back),
                      color: kActiveYellow,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
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
                kSizedBox(60.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${dateTime.year}-${dateTime.month}-${dateTime.day}',
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
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateColor.resolveWith(
                                (states) => kActiveYellow)),
                        child: const Text(
                          'Izvēlies datumu',
                          style: TextStyle(color: kActiveGreen),
                        ),
                        onPressed: () => DatePickerUtils.showDatePicker(context,
                            child: buildDatePicker(),
                            onClicked: () => Navigator.pop(context)))
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
                          // if (_formKey.currentState!.validate()) {
                          log('Moving to gender selection screen');
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => BirthDatePicker()));
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
            () => this.dateTime = dateTime,
          ),
        ),
      );
}
