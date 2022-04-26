import 'dart:developer';

import 'package:emori/auth_screens/profession_screen.dart';
import 'package:emori/model/user/register_user.dart';
import 'package:emori/utilities/constants/text_constants/auth_constants.dart';
import 'package:emori/utilities/constants/widget_constants/widget_constants.dart';
import 'package:emori/utilities/utils/picker_utils.dart';
import 'package:emori/utilities/widgets/auth_widgets/selector_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WorkStatusScreen extends StatefulWidget {
  final RegisterUser registerUser;
  const WorkStatusScreen(this.registerUser, {Key? key}) : super(key: key);

  @override
  State<WorkStatusScreen> createState() => _WorkStatusScreenState();
}

class _WorkStatusScreenState extends State<WorkStatusScreen> {
  late RegisterUser registerUser = widget.registerUser;
  int index = 0;
  static List<String> workStatuses = [
    'Students',
    'Pašnodarbināts',
    'Bezdarbnieks',
    'Pensionārs',
    'Cits'
  ];
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: kActiveGreen,
        body: SafeArea(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 27, right: 27),
                child: Column(
                  children: [
                    kBackArrow(
                        'Returning to education selection screen', context),
                    Row(
                      children: [
                        kInputTextHeading('Atzīmē\nnodarbinātības\nstatusu',
                            kActiveYellow, 32)
                      ],
                    ),
                    kSizedBox(60.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: kDescriptionText(
                              registerUser.workStatus, kActiveYellow, 25),
                        )
                      ],
                    ),
                    kSizedBox(20.0),
                    ButtonWidget(
                        onClicked: () => PickerUtils.showPicker(context,
                            child: buildStatusSelector(),
                            onClicked: () => Navigator.pop(context)))
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
                            registerUser.education +
                            ' | ' +
                            registerUser.workStatus);
                        // if (_formKey.currentState!.validate()) {
                        log('Moving to date picker screen');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ProfessionSelectionScreen(registerUser)));
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

  Widget buildStatusSelector() => SizedBox(
        height: 300,
        child: CupertinoPicker(
          itemExtent: 64,
          onSelectedItemChanged: (index) => setState(() {
            this.index = index;
            if (index == 0) {
              registerUser.workStatus = 'Students';
            } else if (index == 1) {
              registerUser.workStatus = 'Pašnodarbināts';
            } else if (index == 2) {
              registerUser.workStatus = 'Bezdarbnieks';
            } else if (index == 3) {
              registerUser.workStatus = 'Pensionārs';
            } else {
              registerUser.workStatus = 'Cits';
            }
          }),
          selectionOverlay: CupertinoPickerDefaultSelectionOverlay(
            background: kActiveGreen.withOpacity(0.12),
          ),
          children: PickerUtils.workStatusModelBuilder<String>(
            workStatuses,
            (index, status) {
              final isSelected = this.index == index;
              final color = isSelected ? kActiveYellow : Colors.black;
              return Center(
                child: Text(
                  registerUser.workStatus = status,
                  style: TextStyle(color: color, fontSize: 20),
                ),
              );
            },
          ),
        ),
      );
}
