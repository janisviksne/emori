import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utilities/constants/text_constants/text_constants.dart';
import '../../../../utilities/constants/widget_constants/widget_constants.dart';

class FiveNumberTextTaskDoneScreen extends StatelessWidget {
  const FiveNumberTextTaskDoneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kActiveGreen,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w),
          child: Column(
            children: [
              kHeightSizedBox(20.0.h),
              kBackArrowYellow(context),
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  kInputTextHeading('Uzdevums\nizpildīts!', kActiveYellow, 32),
                ],
              ),
              kHeightSizedBox(15.0.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  kCenteredDescription(
                      'Uzdevumu vari veikt atkārtoti līdz jūti, ka\nprāts ir mierīgāks, nepatīkamo\nemociju intensitāte ir mazinājusies.',
                      kActiveYellow,
                      16),
                ],
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      iconSize: 100.0,
                      onPressed: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) =>
                        //             DrawingTaskReflectionScreen1()));
                      },
                      icon: SvgPicture.asset(
                          'assets/images/common/forward_button_yellow.svg'),
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
