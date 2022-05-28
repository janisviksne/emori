import 'dart:developer';

import 'package:emori/request_model/user/register_user.dart';
import 'package:emori/screens/registration_screens/profession_screen.dart';
import 'package:emori/utilities/constants/text_constants/text_constants.dart';
import 'package:emori/utilities/constants/widget_constants/widget_constants.dart';
import 'package:emori/utilities/utils/picker_utils.dart';
import 'package:emori/utilities/widgets/auth_widgets/selector_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
                    kBackArrowYellow(context),
                    Row(
                      children: [
                        kInputTextHeading('Atzīmē\nnodarbinātības\nstatusu',
                            kActiveYellow, 32)
                      ],
                    ),
                    kHeightSizedBox(60.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: kDescriptionText(
                              registerUser.workStatus, kActiveYellow, 25),
                        )
                      ],
                    ),
                    kHeightSizedBox(20.0),
                    ButtonWidget(
                        onClicked: () => PickerUtils.showPicker(context,
                            child: buildStatusSelector(),
                            onClicked: () => Navigator.pop(context)))
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
