import 'dart:developer';

import 'package:emori/request_model/user/register_user.dart';
import 'package:emori/screens/registration_screens/work_status_screen.dart';
import 'package:emori/utilities/constants/text_constants/text_constants.dart';
import 'package:emori/utilities/constants/widget_constants/widget_constants.dart';
import 'package:emori/utilities/widgets/auth_widgets/container_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
                  kBackArrowYellow(context),
                  Row(
                    children: [
                      kInputTextHeading(
                          'Atzīmē savu\nizglītības līmeni ', kActiveYellow, 32)
                    ],
                  ),
                  kHeightSizedBox(10.0),
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
                      kHeightSizedBox(10.0),
                      ContainerButton<int>(
                        value: 2,
                        groupValue: _value,
                        title: 'Pamata',
                        onChanged: (value) => setState(() {
                          registerUser.education = 'Pamata';
                          _value = value!;
                        }),
                      ),
                      kHeightSizedBox(10.0),
                      ContainerButton<int>(
                        value: 3,
                        groupValue: _value,
                        title: 'Vidējā',
                        onChanged: (value) => setState(() {
                          registerUser.education = 'Vidējā';
                          _value = value!;
                        }),
                      ),
                      kHeightSizedBox(20.0),
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
              child: Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(
                      iconSize: 100.0,
                      onPressed: () {
                        log(registerUser.email +
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
                      icon: SvgPicture.asset(
                          'assets/images/common/forward_button_yellow.svg'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
