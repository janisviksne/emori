import 'package:emori/utilities/constants/text_constants/text_constants.dart';
import 'package:emori/utilities/constants/widget_constants/widget_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/svg.dart';

import 'drawing_task_intro5.dart';

class FourthDrawTaskIntroScreen extends StatelessWidget {
  const FourthDrawTaskIntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kActiveGreen,
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  width: 360.w,
                  height: 460.h,
                  child: SvgPicture.asset(
                    'assets/images/interactive_task_backgrounds/draw_task_intro/draw_task_sun4.svg',
                    fit: BoxFit.fill,
                  ),
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
                        'Aplūko savu darbu. Varbūt kādas\natsevišķas līnijas iezīmē kādu tēlu\nvai simbolu? Apvelc tās ar biezāku\nlīnīju vai citu krāsu.',
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
                                builder: (context) =>
                                    FifthDrawTaskIntroScreen()));
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
