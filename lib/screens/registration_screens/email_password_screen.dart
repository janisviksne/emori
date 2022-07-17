import 'package:emori/request_model/user/register_user.dart';
import 'package:emori/screens/registration_screens/login_screen.dart';
import 'package:emori/screens/registration_screens/username_screen.dart';
import 'package:emori/utilities/constants/text_constants/text_constants.dart';
import 'package:emori/utilities/constants/widget_constants/widget_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class EmailPasswordScreen extends StatefulWidget {
  const EmailPasswordScreen({Key? key}) : super(key: key);

  @override
  _EmailPasswordScreenState createState() => _EmailPasswordScreenState();
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

class _EmailPasswordScreenState extends State<EmailPasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  RegisterUser registerUser = RegisterUser(
      '',
      '',
      '',
      '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
      'Vīrietis',
      'Pamata (nepabeigta)',
      'Students',
      List.empty(growable: true));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kActiveYellow,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              kBackArrowGreen(context),
              Container(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        kInputTextHeading('Izveido kontu', kActiveGreen, 40)
                      ],
                    ),
                    kHeightSizedBox(15.0.h),
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      kDescriptionText(
                          'Vai Tev jau ir izveidots konts?', kActiveGreen, 20),
                    ]),
                    kHeightSizedBox(10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen()));
                          },
                          child: const Text(
                            'Ienākt',
                            style: kInputFieldUnderline,
                          ),
                        ),
                      ],
                    ),
                    kHeightSizedBox(20.0),
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
                                return 'E-pasta lauks nedrīkst būt tukšs!';
                              } else if (registerUser.email.isValidEmail() ==
                                  false) {
                                return 'Nepareizi ievadīta e-pasta adrese!';
                              }
                            },
                            style: const TextStyle(
                                fontSize: 20, color: kActiveGreen),
                            decoration:
                                kInputFieldDecoration('E-pasts', kActiveGreen),
                          ),
                          kHeightSizedBox(20.0),
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
                              // else if (!isValidPassword(
                              //     registerUser.password)) {
                              //   return 'Parolē ir pārāk īsa vai tajā ir neatļauti simboli';
                              // }
                            },
                            style: const TextStyle(
                                fontSize: 20, color: kActiveGreen),
                            decoration:
                                kInputFieldDecoration('Parole', kActiveGreen),
                          ),
                          kHeightSizedBox(20.0),
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
              Padding(
                padding: EdgeInsets.symmetric(vertical: 60.0.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      'assets/images/auth_backgrounds/registration_images/hand_registration_email.svg',
                      height: 250.h,
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(right: 20.0.sp),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              iconSize: 100.0,
                              onPressed: () {
                                //ToDo 2. Improve validation messages
                                if (_formKey.currentState!.validate()) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              UsernameScreen(registerUser)));
                                }
                              },
                              icon: SvgPicture.asset(
                                  'assets/images/common/forward_button_green.svg'),
                            ),
                          ],
                        ),
                      ),
                    )
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
