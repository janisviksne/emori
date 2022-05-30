import 'package:emori/utilities/constants/text_constants/text_constants.dart';
import 'package:emori/utilities/constants/widget_constants/widget_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/svg.dart';

import 'drawing_task_intro_screens/drawing_task_intro1.dart';

class DrawingTaskDescriptionScreen extends StatelessWidget {
  const DrawingTaskDescriptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kActiveYellow,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0.h, horizontal: 20.0.w),
          child: Column(
            children: [
              Stack(
                children: [
                  kBackArrowGreen(context),
                ],
              ),
              kHeightSizedBox(10.0),
              Row(
                children: [
                  kDescriptionText('Modulis: modifikācija', kActiveGreen, 16)
                ],
              ),
              kHeightSizedBox(15.0),
              Row(
                children: [kInputTextHeading('Švīkāšana', kActiveGreen, 25)],
              ),
              kHeightSizedBox(5.0),
              Row(
                children: [kTextBoldReadex('7-10 min', kActiveGreen, 18, true)],
              ),
              kHeightSizedBox(10.0),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 300,
                child: Stack(
                  children: [
                    SvgPicture.asset(
                      'assets/images/common/green_tile_background.svg',
                      fit: BoxFit.fill,
                    ),
                    SvgPicture.asset(
                      'assets/images/interactive_task_backgrounds/draw_task/draw_tile_person.svg',
                      fit: BoxFit.fill,
                    )
                  ],
                ),
              ),
              kHeightSizedBox(10.0),
              Row(
                children: [kTextBoldMontagu('Mērķis', kActiveGreen, 18, true)],
              ),
              kHeightSizedBox(10.0),
              Row(
                children: [
                  kDescriptionText(
                      'Pilnveidot prasmi aktīvi mainīt\n(modificēt) nevēlemās emocijas intensitāti.',
                      kActiveGreen,
                      16)
                ],
              ),
              kHeightSizedBox(10.0),
              Row(
                children: [kTextBoldMontagu('Saturs', kActiveGreen, 18, true)],
              ),
              kHeightSizedBox(5.0),
              kTaskDescriptionListItem('Zīmēšana'),
              kHeightSizedBox(5.0),
              kTaskDescriptionListItem('Refleksija'),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    iconSize: 100.0,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  FirstDrawTaskIntroScreen()));
                    },
                    icon: SvgPicture.asset(
                        'assets/images/common/forward_button_green.svg'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
