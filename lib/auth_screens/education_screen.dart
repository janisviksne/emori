import 'dart:developer';

import 'package:emori/auth_screens/work_status.dart';
import 'package:emori/utilities/auth_constants.dart';
import 'package:emori/utilities/widget_constants.dart';
import 'package:emori/utilities/widgets/auth_widgets/container_button.dart';
import 'package:flutter/material.dart';

class EducationSelectionScreen extends StatefulWidget {
  const EducationSelectionScreen({Key? key}) : super(key: key);

  @override
  State<EducationSelectionScreen> createState() =>
      _EducationSelectionScreenState();
}

class _EducationSelectionScreenState extends State<EducationSelectionScreen> {
  int _value = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kActiveGreen,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 27, right: 27),
              child: Column(
                children: [
                  kBackArrow('Returning to gender selection screen', context),
                  Row(
                    children: [
                      kInputTextHeading(
                          'Atzīmē savu\nizglītības līmeni ', kActiveYellow, 40)
                    ],
                  ),
                  kSizedBox(20.0),
                  Column(
                    children: [
                      ContainerButton<int>(
                        value: 1,
                        groupValue: _value,
                        title: 'Pamata (nepabeigta)',
                        onChanged: (value) => setState(() => _value = value!),
                      ),
                      kSizedBox(20.0),
                      ContainerButton<int>(
                        value: 2,
                        groupValue: _value,
                        title: 'Pamata',
                        onChanged: (value) => setState(() => _value = value!),
                      ),
                      kSizedBox(20.0),
                      ContainerButton<int>(
                        value: 3,
                        groupValue: _value,
                        title: 'Vidējā',
                        onChanged: (value) => setState(() => _value = value!),
                      ),
                      kSizedBox(20.0),
                      ContainerButton<int>(
                        value: 4,
                        groupValue: _value,
                        title: 'Augstākā',
                        onChanged: (value) => setState(() => _value = value!),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/auth_backgrounds/education.png',
                        fit: BoxFit.cover,
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      IconButton(
                        padding: const EdgeInsets.only(top: 100, right: 10.0),
                        iconSize: 50.0,
                        onPressed: () {
                          // if (_formKey.currentState!.validate()) {
                          log('Moving to work status selection screen');
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const WorkStatusScreen()));
                          // }
                        },
                        icon: const Icon(Icons.arrow_forward),
                        color: kActiveYellow,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
