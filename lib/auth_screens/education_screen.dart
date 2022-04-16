import 'dart:developer';

import 'package:emori/auth_screens/work_status.dart';
import 'package:emori/utilities/auth_constants.dart';
import 'package:emori/utilities/widget_constants.dart';
import 'package:emori/utilities/widgets/auth_widgets/profession_listtile_widget.dart';
import 'package:flutter/material.dart';

class EducationSelectionScreen extends StatefulWidget {
  @override
  State<EducationSelectionScreen> createState() =>
      _EducationSelectionScreenState();
}

class _EducationSelectionScreenState extends State<EducationSelectionScreen> {
  //int _value = 1;
  final allProfessions = [
    'Administratīvais darbs',
    'Būvniecība',
    'Drošība / aizsardzība',
    'Finanses',
    'Informācijas tehnoloģijas',
  ];
  List<String> selectedProfessions = [];
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
                ],
              ),
            ),
            Expanded(
              child: ListView(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: allProfessions.map((profession) {
                    final isSelected = selectedProfessions.contains(profession);
                    return ProfessionListTileWidget(
                        isSelected: isSelected,
                        profession: profession,
                        onSelectedProfession: selectProfession);
                  }).toList()),
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [], // <- INSERT IMAGE HERE FOR EDUCATION SELECTION
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

  void selectProfession(String profession) {
    final isSelected = selectedProfessions.contains(profession);
    setState(() {
      isSelected
          ? selectedProfessions.remove(profession)
          : selectedProfessions.add(profession);
    });
  }
}
