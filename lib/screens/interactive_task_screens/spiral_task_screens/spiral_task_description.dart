import 'package:emori/screens/interactive_task_screens/spiral_task_screens/spiral_task_intro.dart';
import 'package:emori/utilities/constants/text_constants/text_constants.dart';
import 'package:emori/utilities/constants/widget_constants/widget_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/svg.dart';

class SpiralTaskDescriptionScreen extends StatelessWidget {
  const SpiralTaskDescriptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kActiveYellow,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0.h, horizontal: 20.0.w),
          child: Column(
            children: [
              Stack(
                children: [
                  kBackArrowGreen(context),
                ],
              ),
              kHeightSizedBox(10.0.h),
              Row(
                children: [
                  kDescriptionText('\tModulis: modifikācija', kActiveGreen, 16)
                ],
              ),
              kHeightSizedBox(40.0.h),
              Row(
                children: [
                  kInputTextHeading('Cerību spirāle', kActiveGreen, 25)
                ],
              ),
              kHeightSizedBox(55.0.h),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 300,
                child: Stack(
                  children: [
                    SvgPicture.asset(
                      'assets/images/common/green_tile_background.svg',
                      fit: BoxFit.fill,
                    ),
                    SvgPicture.asset(
                      'assets/images/interactive_task_backgrounds/spiral_task/spiral_task_person.svg',
                      fit: BoxFit.fill,
                    )
                  ],
                ),
              ),
              kHeightSizedBox(40.0.h),
              Row(
                children: [kTextBoldMontagu('Mērķis', kActiveGreen, 18, true)],
              ),
              kHeightSizedBox(10.0.h),
              Row(
                children: [
                  kCenteredDescription(
                      'Spirāle simbolizē pozitīvu, radošu spēku\n enerģijas virzību un pārmaiņas.\nŠis uzdevums tev varētu palīdzēt vērst\nuzmanību uz pozitīvo.',
                      kActiveGreen,
                      16)
                ],
              ),
              kHeightSizedBox(30.0.h),
              Row(
                children: [kTextBoldMontagu('Saturs', kActiveGreen, 18, true)],
              ),
              kHeightSizedBox(5.0.h),
              kTaskDescriptionListItem('Zīmēšana'),
              kHeightSizedBox(5.0.h),
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
                              builder: (context) => SpiralTaskIntroScreen()));
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
