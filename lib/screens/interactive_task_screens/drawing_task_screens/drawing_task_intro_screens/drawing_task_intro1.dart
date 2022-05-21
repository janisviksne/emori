import 'package:emori/screens/interactive_task_screens/drawing_task_screens/drawing_task_intro_screens/drawing_task_intro2.dart';
import 'package:emori/utilities/constants/text_constants/text_constants.dart';
import 'package:emori/utilities/constants/widget_constants/widget_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FirstDrawTaskIntroScreen extends StatelessWidget {
  const FirstDrawTaskIntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kActiveGreen,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20.0.h),
              child: kYellowExitCross(context),
            ),
            Stack(
              children: [
                SvgPicture.asset(
                    'assets/images/interactive_task_backgrounds/draw_task_intro/draw_task_sun1.svg'),
                Padding(
                  padding: EdgeInsets.only(left: 20.0.w, top: 90.0.h),
                  child: Row(
                    children: [
                      kInputTextHeading('Instrukcija', kActiveYellow, 26),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.0.w, top: 140.0.h),
                  child: kTextBoldReadex(
                      'Ļaujies brīvām pirksta\nkustībām pa ekrānu.',
                      kActiveYellow,
                      18,
                      false),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(right: 20.0.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(
                      iconSize: 100.0,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    SecondDrawTaskIntroScreen()));
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
  }
}
