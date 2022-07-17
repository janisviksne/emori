import 'dart:convert';
import 'dart:convert' as convert;
import 'dart:developer';

import 'package:emori/request_model/user/login_user.dart';
import 'package:emori/utilities/constants/endpoint_constants.dart';
import 'package:emori/utilities/constants/text_constants/text_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;

import '../questionnaire_screens/questionnaire_a_intro.dart';
import 'email_password_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  LoginUser loginUser = LoginUser(0, "", "");

  Future login() async {
    var response = await http.post(Uri.parse(Endpoints.LOGIN_ENDPOINT),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(
            {'email': loginUser.email, 'password': loginUser.password}));
    if (response.statusCode == 200) {
      log(response.body);
      loginUser.userId = await convert.jsonDecode(response.body);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QuestionnaireAIntroScreen(loginUser.userId),
          ));
    } else {
      log(response.statusCode.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kActiveYellow,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding:
                    EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.0.w),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        kInputTextHeading('Ienāc kontā', kActiveGreen, 30),
                      ],
                    ),
                    kHeightSizedBox(20.0.h),
                    Row(
                      children: [
                        kDescriptionText('Ievadi savus esošos pieejas datus',
                            kActiveGreen, 16),
                      ],
                    ),
                    kHeightSizedBox(20.0.h),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            obscureText: false,
                            controller:
                                TextEditingController(text: loginUser.email),
                            onChanged: (val) {
                              loginUser.email = val;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'E-pasta lauks nedrīkst būt tukšs!';
                              }
                            },
                            style: const TextStyle(
                                fontSize: 20, color: kActiveGreen),
                            decoration:
                                kInputFieldDecoration('E-pasts', kActiveGreen),
                          ),
                          kHeightSizedBox(20.0.h),
                          TextFormField(
                            obscureText: true,
                            controller:
                                TextEditingController(text: loginUser.password),
                            onChanged: (val) {
                              loginUser.password = val;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Paroles lauks nedrīkst būt tukšs!';
                              }
                            },
                            style: const TextStyle(
                                fontSize: 20, color: kActiveGreen),
                            decoration:
                                kInputFieldDecoration('Parole', kActiveGreen),
                          ),
                        ],
                      ),
                    ),
                    kHeightSizedBox(20.0.h),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            log('Redirect to forgot password.');
                          },
                          child: const Text(
                            'Aizmirsi paroli?',
                            style: kInputFieldUnderline,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: kActiveGreen,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 12),
                              textStyle: const TextStyle(
                                  fontSize: 16, color: kActiveYellow)),
                          child: const Text('Reģistrējies'),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const EmailPasswordScreen()));
                          },
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0.h),
                //ToDo Image should not get pushed down by failing validation
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      'assets/images/auth_backgrounds/login_screen_image.svg',
                      height: 355.h,
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(right: 30.0.sp),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              iconSize: 100.0,
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  login();
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
