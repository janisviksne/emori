import 'package:emori/utilities/constants/text_constants/text_constants.dart';
import 'package:emori/utilities/constants/widget_constants/widget_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'drawing_task_intro3.dart';

class SecondDrawTaskIntroScreen extends StatelessWidget {
  const SecondDrawTaskIntroScreen({Key? key}) : super(key: key);

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
                    'assets/images/interactive_task_backgrounds/draw_task_intro/draw_task_sun2.svg'),
                Padding(
                  padding: EdgeInsets.only(top: 30.0.h, left: 20.0.w),
                  child: kBackArrowYellow(context),
                ),
              ],
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 20.0.h),
              child: Row(
                children: [
                  kDescriptionText(
                      'Izmēģini švīkāšanu ar katru rokas\npirkstu, gan ar labo roku, gan\nkreiso roku. Kustībām ar katru\npirkstu velti 5-10 sekundes.',
                      kActiveYellow,
                      16)
                ],
              ),
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
                                    ThirdDrawTaskIntroScreen()));
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
