import 'dart:developer';

import 'package:emori/model/user/register_user.dart';
import 'package:emori/screens/auth_screens/work_status_screen.dart';
import 'package:emori/utilities/constants/text_constants/auth_constants.dart';
import 'package:emori/utilities/constants/widget_constants/widget_constants.dart';
import 'package:emori/utilities/widgets/auth_widgets/container_button.dart';
import 'package:flutter/material.dart';

class EducationSelectionScreen extends StatefulWidget {
  final RegisterUser registerUser;
  const EducationSelectionScreen(this.registerUser, {Key? key})
      : super(key: key);

  @override
  State<EducationSelectionScreen> createState() =>
      _EducationSelectionScreenState();
}

class _EducationSelectionScreenState extends State<EducationSelectionScreen> {
  int _value = 1;
  late RegisterUser registerUser = widget.registerUser;
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
                        onChanged: (value) => setState(() {
                          registerUser.education = 'Pamata (nepabeigta)';
                          _value = value!;
                        }),
                      ),
                      kSizedBox(20.0),
                      ContainerButton<int>(
                        value: 2,
                        groupValue: _value,
                        title: 'Pamata',
                        onChanged: (value) => setState(() {
                          registerUser.education = 'Pamata';
                          _value = value!;
                        }),
                      ),
                      kSizedBox(20.0),
                      ContainerButton<int>(
                        value: 3,
                        groupValue: _value,
                        title: 'Vidējā',
                        onChanged: (value) => setState(() {
                          registerUser.education = 'Vidējā';
                          _value = value!;
                        }),
                      ),
                      kSizedBox(20.0),
                      ContainerButton<int>(
                        value: 4,
                        groupValue: _value,
                        title: 'Augstākā',
                        onChanged: (value) => setState(() {
                          registerUser.education = 'Augstākā';
                          _value = value!;
                        }),
                      ),
                    ],
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
                      print(registerUser.email +
                          ' | ' +
                          registerUser.password +
                          ' | ' +
                          registerUser.nickname +
                          ' | ' +
                          registerUser.birthDate.toString() +
                          ' | ' +
                          registerUser.gender +
                          ' | ' +
                          registerUser.education);
                      // if (_formKey.currentState!.validate()) {
                      log('Moving to education selection screen');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  WorkStatusScreen(registerUser)));
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
    );
  }
}
