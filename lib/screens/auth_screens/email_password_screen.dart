import 'package:emori/model/user/register_user.dart';
import 'package:emori/screens/auth_screens/login_screen.dart';
import 'package:emori/screens/auth_screens/username_screen.dart';
import 'package:emori/utilities/constants/text_constants/auth_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EmailPasswordScreen extends StatefulWidget {
  const EmailPasswordScreen({Key? key}) : super(key: key);

  @override
  _EmailPasswordScreenState createState() => _EmailPasswordScreenState();
}

class _EmailPasswordScreenState extends State<EmailPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  RegisterUser registerUser = RegisterUser(
      '', '', '', '', '', '', 'Students', List.empty(growable: true));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kActiveYellow,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 10.0, top: 10.0),
              child: Row(
                children: [
                  IconButton(
                    iconSize: 50.0,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: SvgPicture.asset(
                        'assets/images/common/back_arrow_green.svg'),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      kInputTextHeading('Izveido\nsavu kontu', kActiveGreen, 40)
                    ],
                  ),
                  kSizedBox(20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        'Vai Tev jau ir izveidots konts? ',
                        style: TextStyle(color: kActiveGreen, fontSize: 20),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Login()));
                        },
                        child: const Text(
                          'Ienākt',
                          style: kInputFieldUnderline,
                        ),
                      ),
                    ],
                  ),
                  kSizedBox(20.0),
                  Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextFormField(
                          obscureText: false,
                          controller:
                              TextEditingController(text: registerUser.email),
                          onChanged: (val) {
                            registerUser.email = val;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Šis lauks nedrīkst būt tukšs!';
                            }
                          },
                          style: const TextStyle(
                              fontSize: 20, color: kActiveGreen),
                          decoration:
                              kInputFieldDecoration('E-pasts', kActiveGreen),
                        ),
                        kSizedBox(20.0),
                        TextFormField(
                          obscureText: true,
                          controller: TextEditingController(
                              text: registerUser.password),
                          onChanged: (val) {
                            registerUser.password = val;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Šis lauks nedrīkst būt tukšs!';
                            } else if (registerUser.password != value) {
                              return 'Ievadītās paroles nesakrīt!';
                            }
                          },
                          style: const TextStyle(
                              fontSize: 20, color: kActiveGreen),
                          decoration:
                              kInputFieldDecoration('Parole', kActiveGreen),
                        ),
                        kSizedBox(20.0),
                        TextFormField(
                          textAlign: TextAlign.left,
                          obscureText: true,
                          controller: TextEditingController(
                              text: registerUser.password),
                          onChanged: (val) {
                            registerUser.password = val;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Šis lauks nedrīkst būt tukšs!';
                            } else if (registerUser.password != value) {
                              return 'Ievadītās paroles nesakrīt!';
                            }
                          },
                          style: const TextStyle(
                              fontSize: 20, color: kActiveGreen),
                          decoration: kInputFieldDecoration(
                              'Parole atkārtoti', kActiveGreen),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    'assets/images/auth_backgrounds/hand_registration_email.svg',
                    height: 200,
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            iconSize: 100.0,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          UsernameScreen(registerUser)));
                            },
                            icon: SvgPicture.asset(
                                'assets/images/common/inactive_forward_button_green.svg'),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
