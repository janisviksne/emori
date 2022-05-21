import 'package:emori/utilities/constants/text_constants/text_constants.dart';
import 'package:emori/utilities/constants/widget_constants/widget_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/svg.dart';

import 'drawing_task_intro4.dart';

class ThirdDrawTaskIntroScreen extends StatelessWidget {
  const ThirdDrawTaskIntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kActiveGreen,
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                SvgPicture.asset(
                    'assets/images/interactive_task_backgrounds/draw_task_intro/draw_task_sun3.svg'),
                Padding(
                  padding: EdgeInsets.only(top: 30.0.h, left: 20.0.w),
                  child: kBackArrowYellow(context),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 290.0.h, horizontal: 37.5.w),
                  child: kDescriptionText(
                      'Uz brīdi aizver acis, pievērs\nuzmanību, kā mainās izjūtas.',
                      kActiveYellow,
                      16),
                )
              ],
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0.w),
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
                                    FourthDrawTaskIntroScreen()));
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
