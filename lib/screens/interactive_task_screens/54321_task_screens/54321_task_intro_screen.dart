import 'package:emori/utilities/constants/text_constants/text_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utilities/constants/widget_constants/widget_constants.dart';
import '54321_interactive_screens/54321_task_screen_initial.dart';

class FiveNumberTaskIntroScreen extends StatelessWidget {
  const FiveNumberTaskIntroScreen({Key? key}) : super(key: key);

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
                  height: 425.h,
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
              ],
            ),
            kHeightSizedBox(20.0.h),
            Center(child: kInputTextHeading('Ļaujies', kActiveYellow, 30)),
            kHeightSizedBox(20.0.h),
            Center(
              child: kCenteredDescription(
                  'Seko norādēm un ieklausies sevī.\nUzdevuma laikā nekas nav\njāpieraksta vai jāzīmē.',
                  kActiveYellow,
                  18),
            ),
            Expanded(
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 20.0.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(
                      iconSize: 125.0,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    FiveNumberTaskFirstScreen()));
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
