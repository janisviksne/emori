import 'package:emori/utilities/constants/text_constants/text_constants.dart';
import 'package:emori/utilities/constants/widget_constants/widget_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/svg.dart';

class LoveMyselfTaskIntroScreen extends StatelessWidget {
  const LoveMyselfTaskIntroScreen({Key? key}) : super(key: key);

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
            Padding(
              padding: EdgeInsets.only(left: 20.0.w, top: 90.0.h),
              child: Row(
                children: [
                  kInputTextHeading('Instrukcija', kActiveYellow, 26),
                ],
              ),
            ),
            kHeightSizedBox(15.0.h),
            Padding(
              padding: EdgeInsets.only(left: 20.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  kTextBoldReadex(
                      'Pabeidz teikumus, vēršot\nuzmanību uz pozitīvo.',
                      kActiveYellow,
                      18,
                      false),
                ],
              ),
            ),
            Expanded(
                child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 42.0.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SvgPicture.asset(
                        'assets/images/interactive_task_backgrounds/love_myself_task/love_myself_sun.svg',
                        height: 420.h,
                        fit: BoxFit.fill,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 20.0.w, top: 325.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        iconSize: 100.0,
                        onPressed: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) =>
                          //             SecondDrawTaskIntroScreen()));
                        },
                        icon: SvgPicture.asset(
                            'assets/images/common/forward_button_yellow.svg'),
                      ),
                    ],
                  ),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
