import 'package:emori/utilities/constants/text_constants/text_constants.dart';
import 'package:emori/utilities/constants/widget_constants/widget_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/svg.dart';

import '../drawing_task_screen.dart';

class FifthDrawTaskIntroScreen extends StatelessWidget {
  const FifthDrawTaskIntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kActiveGreen,
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 575.h,
                      child: SvgPicture.asset(
                        'assets/images/interactive_task_backgrounds/draw_task_intro/draw_task_sun5.svg',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 30.0.h, horizontal: 20.0.w),
                  child: kBackArrowYellow(context),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 260.0.h),
                  child: Center(
                    child: kDescriptionText(
                        'Ja vēlies, papildini zimējumu\nar citām krāsām un līnijām.',
                        kActiveYellow,
                        16),
                  ),
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
                                builder: (context) => DrawingTaskScreen()));
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
