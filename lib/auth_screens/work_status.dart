import 'package:emori/utilities/auth_constants.dart';
import 'package:emori/utilities/utils/picker_utils.dart';
import 'package:emori/utilities/widget_constants.dart';
import 'package:emori/utilities/widgets/auth_widgets/selector_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WorkStatusScreen extends StatefulWidget {
  const WorkStatusScreen({Key? key}) : super(key: key);

  @override
  State<WorkStatusScreen> createState() => _WorkStatusScreenState();
}

class _WorkStatusScreenState extends State<WorkStatusScreen> {
  int index = 0;
  String selectedValue = ''; //ToDo pass this as the user status
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
                            kActiveYellow, 40)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [],
                    ),
                    kSizedBox(20.0),
                    ButtonWidget(
                        onClicked: () => PickerUtils.showPicker(context,
                            child: buildStatusSelector(),
                            onClicked: () => Navigator.pop(context)))
                  ],
                ),
              )
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
          }),
          selectionOverlay: CupertinoPickerDefaultSelectionOverlay(
            background: kActiveGreen.withOpacity(0.12),
          ),
          children: PickerUtils.workStatusModelBuilder<String>(
            workStatuses,
            (index, status) {
              final isSelected = this.index == index;
              final color = isSelected ? kActiveYellow : Colors.black;
              //ToDo add implementation where it updates the value (So I can pass it)
              return Center(
                child: Text(
                  status,
                  style: TextStyle(color: color, fontSize: 20),
                ),
              );
            },
          ),
        ),
      );
}
