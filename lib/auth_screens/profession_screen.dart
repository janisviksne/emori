import 'dart:convert';
import 'dart:developer';

import 'package:emori/model/user/register_user.dart';
import 'package:emori/utilities/constants/text_constants/auth_constants.dart';
import 'package:emori/utilities/constants/widget_constants/widget_constants.dart';
import 'package:emori/utilities/widgets/auth_widgets/profession_listtile_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'temporary.dart';

class ProfessionSelectionScreen extends StatefulWidget {
  final RegisterUser registerUser;
  const ProfessionSelectionScreen(this.registerUser, {Key? key})
      : super(key: key);

  @override
  State<ProfessionSelectionScreen> createState() =>
      _ProfessionSelectionScreenState();
}

class _ProfessionSelectionScreenState extends State<ProfessionSelectionScreen> {
  String url = "http://10.0.2.2:8080/registerUserData";
  Future login() async {
    var res = await http.post(Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'email': registerUser.email,
          'password': registerUser.password,
          'nickname': registerUser.nickname,
          'birthdate': registerUser.birthdate
        }));
    log(res.body);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TempScreen(),
        ));
  }

  late RegisterUser registerUser = widget.registerUser;
  //int _value = 1;
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
                  kBackArrow('Returning to gender selection screen', context),
                  Row(
                    children: [
                      kInputTextHeading('Atzīmē savas\nnodarbinātības\nsfēras',
                          kActiveYellow, 40)
                    ],
                  ),
                  kSizedBox(20.0),
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
                      IconButton(
                        padding: const EdgeInsets.only(top: 100, right: 10.0),
                        iconSize: 50.0,
                        onPressed: () {
                          print(registerUser.email +
                              ' | ' +
                              registerUser.password +
                              ' | ' +
                              registerUser.nickname +
                              ' | ' +
                              registerUser.birthdate.toString() +
                              ' | ' +
                              registerUser.gender +
                              ' | ' +
                              registerUser.education +
                              ' | ' +
                              registerUser.workStatus +
                              ' | ' +
                              registerUser.occupations.toString());
                          // if (_formKey.currentState!.validate()) {
                          log('Moving to work status selection screen');
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
