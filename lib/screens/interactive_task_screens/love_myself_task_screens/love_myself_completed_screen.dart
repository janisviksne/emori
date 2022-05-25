import 'package:emori/utilities/constants/text_constants/text_constants.dart';
import 'package:emori/utilities/constants/widget_constants/widget_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'love_myself_reflection_screen.dart';

class LoveMyselfTaskFinishScreen extends StatelessWidget {
  const LoveMyselfTaskFinishScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kActiveYellow,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w),
          child: Column(
            children: [
              kHeightSizedBox(20.0.h),
              kBackArrowGreen(context),
              kHeightSizedBox(10.0.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/images/common/tasks/task_finished_person.svg',
                    width: 305.w,
                    height: 315.h,
                  )
                ],
              ),
              kHeightSizedBox(10.0.h),
              Row(
                children: [
                  kInputTextHeading('Uzdevums\nizpildīts!', kActiveGreen, 32),
                ],
              ),
              kHeightSizedBox(5.0.h),
              Row(
                children: [
                  kDescriptionText(
                      'Šo uzdevumu vari veikt vairākas reizes\nlīdz jūti, ka prāts kļuvis mierīgāks un\nnepatīkamo emociju intensitāte ir\nmazinājusies.',
                      kActiveGreen,
                      16),
                ],
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      iconSize: 100.0,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    //ToDo pass user Info
                                    LoveMyselfReflectionScreen()));
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
