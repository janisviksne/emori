import 'dart:developer';

import 'package:emori/auth_screens/education_screen.dart';
import 'package:emori/model/user/register_user.dart';
import 'package:emori/utilities/constants/text_constants/auth_constants.dart';
import 'package:emori/utilities/widgets/auth_widgets/container_button.dart';
import 'package:flutter/material.dart';

class GenderScreen extends StatefulWidget {
  final RegisterUser registerUser;
  const GenderScreen(this.registerUser, {Key? key}) : super(key: key);

  @override
  State<GenderScreen> createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  late RegisterUser registerUser = widget.registerUser;
  int _value = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kActiveGreen,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 27, right: 27),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    iconSize: 50.0,
                    onPressed: () {
                      Navigator.pop(context);
                      log('Returning to date picker screen');
                    },
                    icon: const Icon(Icons.arrow_back),
                    color: kActiveYellow,
                  ),
                ],
              ),
              kSizedBox(10.0),
              Row(
                children: [
                  kInputTextHeading('Norādi savu\ndzimumu', kActiveYellow, 40)
                ],
              ),
              kSizedBox(30.0),
              Column(
                children: [
                  ContainerButton<int>(
                    value: 1,
                    groupValue: _value,
                    title: 'Vīrietis',
                    onChanged: (value) => setState(() {
                      registerUser.gender = 'Vīrietis';
                      _value = value!;
                    }),
                  ),
                  kSizedBox(20.0),
                  ContainerButton<int>(
                    value: 2,
                    groupValue: _value,
                    title: 'Sieviete',
                    onChanged: (value) => setState(() {
                      registerUser.gender = 'Sieviete';
                      _value = value!;
                    }),
                  ),
                  kSizedBox(20.0),
                  ContainerButton<int>(
                    value: 3,
                    groupValue: _value,
                    title: 'Cits',
                    onChanged: (value) => setState(() {
                      registerUser.gender = 'Cits';
                      _value = value!;
                    }),
                  ),
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
                            registerUser.birthDate.toString() +
                            ' | ' +
                            registerUser.gender);
                        // if (_formKey.currentState!.validate()) {
                        log('Moving to education selection screen');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    EducationSelectionScreen(registerUser)));
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
}
