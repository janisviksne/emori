import 'package:emori/utilities/constants/text_constants/text_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utilities/constants/widget_constants/widget_constants.dart';
import '54321_task_intro_screen.dart';

class FiveNumberTaskDescriptionScreen extends StatelessWidget {
  const FiveNumberTaskDescriptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kActiveYellow,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0.h, horizontal: 20.0.w),
          child: Column(
            children: [
              Row(
                children: [
                  kBackArrowGreen(context),
                  Padding(
                    padding: EdgeInsets.only(left: 160.0.w),
                    child:
                        SvgPicture.asset('assets/images/common/emori_logo.svg'),
                  )
                ],
              ),
              kHeightSizedBox(10.0.h),
              Row(
                children: [
                  kDescriptionText('Modulis: modifikācija', kActiveGreen, 16)
                ],
              ),
              kHeightSizedBox(15.0.h),
              Row(
                children: [kInputTextHeading('5-4-3-2-1', kActiveGreen, 25)],
              ),
              kHeightSizedBox(10.0),
              SizedBox(
                width: 350.w,
                height: 350.h,
                child: Stack(
                  children: [
                    SvgPicture.asset(
                      'assets/images/common/green_tile_background.svg',
                      fit: BoxFit.fill,
                    ),
                    SvgPicture.asset(
                        'assets/images/interactive_task_backgrounds/54321_task/54321_description.svg'),
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
                      'Šis uzdevums Tev varētu palīdzēt aktīvi mainīt\n(modificēt) nevēlemās emocijas intensitāti,\npievēršot uzmanību pozitīvajam.',
                      kActiveGreen,
                      16)
                ],
              ),
              kHeightSizedBox(10.0),
              Row(
                children: [kTextBoldMontagu('Saturs', kActiveGreen, 18, true)],
              ),
              kHeightSizedBox(5.0),
              kTaskDescriptionListItem('Rakstīšana'),
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
                                  FiveNumberTaskIntroScreen()));
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
