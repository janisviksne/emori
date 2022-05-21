import 'dart:developer';

import 'package:emori/model/user/register_user.dart';
import 'package:emori/utilities/constants/text_constants/text_constants.dart';
import 'package:emori/utilities/constants/widget_constants/widget_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'birthdate_screen.dart';

class UsernameScreen extends StatefulWidget {
  final RegisterUser registerUser;
  const UsernameScreen(this.registerUser, {Key? key}) : super(key: key);

  @override
  _UsernameState createState() => _UsernameState();
}

class _UsernameState extends State<UsernameScreen> {
  //passed register user from previous screen
  late RegisterUser registerUser = widget.registerUser;

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: kActiveGreen,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                kBackArrowYellow(context),
                kHeightSizedBox(15.0),
                Row(
                  children: [
                    kInputTextHeading('Kā Tevi uzrunāt?', kActiveYellow, 32)
                  ],
                ),
                kHeightSizedBox(15.0),
                Row(
                  children: [
                    kDescriptionText(
                        'Ieraksti vārdu, kurā vēlies, lai lietotne\nTevi uzrunā dažādās sadaļās.',
                        kActiveYellow,
                        18)
                  ],
                ),
                kHeightSizedBox(15.0),
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
                          decoration: kInputFieldDecoration(
                              'Uzruna / vārds', kActiveYellow),
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
                        iconSize: 100.0,
                        onPressed: () {
                          log(registerUser.email +
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
                        icon: SvgPicture.asset(
                            'assets/images/common/forward_button_yellow.svg'),
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
