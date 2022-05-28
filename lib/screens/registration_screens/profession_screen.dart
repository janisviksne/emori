import 'dart:convert';
import 'dart:developer';

import 'package:emori/request_model/user/register_user.dart';
import 'package:emori/screens/registration_screens/login_screen.dart';
import 'package:emori/utilities/constants/endpoint_constants.dart';
import 'package:emori/utilities/constants/text_constants/text_constants.dart';
import 'package:emori/utilities/constants/widget_constants/widget_constants.dart';
import 'package:emori/utilities/widgets/auth_widgets/profession_listtile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;

class ProfessionSelectionScreen extends StatefulWidget {
  final RegisterUser registerUser;
  const ProfessionSelectionScreen(this.registerUser, {Key? key})
      : super(key: key);

  @override
  State<ProfessionSelectionScreen> createState() =>
      _ProfessionSelectionScreenState();
}

class _ProfessionSelectionScreenState extends State<ProfessionSelectionScreen> {
  Future registerNewUser() async {
    var response = await http.post(Uri.parse(Endpoints.REGISTER_ENDPOINT),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'email': registerUser.email,
          'password': registerUser.password,
          'nickname': registerUser.nickname,
          'birthDate': registerUser.birthDate,
          'gender': registerUser.gender,
          'education': registerUser.education,
          'workStatus': registerUser.workStatus,
          'occupations': registerUser.occupations
        }));
    log(response.body);
    if (response.statusCode == 200) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ));
    } else {
      log(response.statusCode.toString());
    }
  }

  late RegisterUser registerUser = widget.registerUser;
  final allProfessions = [
    'Administratīvais darbs',
    'Būvniecība',
    'Drošība / aizsardzība',
    'Finanses',
    'Informācijas tehnoloģijas',
  ];
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
                      kInputTextHeading('Atzīmē savas\nnodarbinātības\nsfēras',
                          kActiveYellow, 40)
                    ],
                  ),
                  kHeightSizedBox(20.0),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: allProfessions.map((profession) {
                    final isSelected =
                        registerUser.occupations.contains(profession);
                    return ProfessionListTileWidget(
                        isSelected: isSelected,
                        profession: profession,
                        onSelectedProfession: selectProfession);
                  }).toList()),
            ),
            Row(
              children: [
                // Expanded(
                //   child: Column(
                //     children: [], // <- INSERT IMAGE HERE FOR EDUCATION SELECTION
                //   ),
                // ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
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
                                    registerUser.education +
                                    ' | ' +
                                    registerUser.workStatus);
                                // if (_formKey.currentState!.validate()) {
                                log('Moving to date picker screen');
                                registerNewUser();
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
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void selectProfession(String profession) {
    var isSelected = registerUser.occupations.contains(profession);
    setState(() {
      isSelected
          ? registerUser.occupations.remove(profession)
          : registerUser.occupations.add(profession);
      if (registerUser.occupations.length > 4) {
        registerUser.occupations.remove(profession);
      }
    });
  }
}
