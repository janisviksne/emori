import 'package:emori/screens/interactive_task_screens/54321_task_screens/54321_interactive_screens/54321_interactive_task_text_screens/54321_task_screen_text3.dart';
import 'package:emori/utilities/constants/text_constants/text_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class FiveNumberTaskScreenText2 extends StatelessWidget {
  const FiveNumberTaskScreenText2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w),
          child: Column(
            children: [
              Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0.h),
                    child: IconButton(
                      iconSize: 50.0,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: SvgPicture.asset(
                          'assets/images/common/back_arrow_green.svg'),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          iconSize: 75.0.sp,
                          onPressed: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) =>
                            //             SpiralTaskDescriptionScreen()));
                          },
                          icon: SvgPicture.asset(
                              'assets/images/interactive_task_backgrounds/draw_task/green_info_icon.svg'))
                    ],
                  )
                ],
              ),
              kHeightSizedBox(40.0.h),
              Center(
                child: kInputTextHeading(
                    'Tālāk ieklausies trīs\ndažādās skaņās, ko\nsadzirdi.',
                    kActiveGreen,
                    30),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      iconSize: 100.0.sp,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    FiveNumberTaskScreenText3()));
                      },
                      icon: SvgPicture.asset(
                          'assets/images/common/forward_button_green.svg'),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
