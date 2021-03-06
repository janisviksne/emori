import 'package:emori/screens/interactive_task_screens/love_myself_task_screens/love_myself_intro_screen.dart';
import 'package:emori/utilities/constants/text_constants/text_constants.dart';
import 'package:emori/utilities/constants/widget_constants/widget_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/svg.dart';

class LoveMyselfTaskDescriptionScreen extends StatelessWidget {
  const LoveMyselfTaskDescriptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kActiveYellow,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0.h, horizontal: 20.0.w),
          child: Column(
            children: [
              kBackArrowGreen(context),
              kHeightSizedBox(10.0),
              Row(
                children: [
                  kDescriptionText('Modulis: modifikācija', kActiveGreen, 16)
                ],
              ),
              kHeightSizedBox(15.0),
              Row(
                children: [
                  kInputTextHeading('Es sev patīku', kActiveGreen, 25)
                ],
              ),
              kHeightSizedBox(5.0),
              Row(
                children: [kTextBoldReadex('7-10 min', kActiveGreen, 18, true)],
              ),
              kHeightSizedBox(10.0),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 300,
                child: Stack(
                  children: [
                    SvgPicture.asset(
                      'assets/images/common/green_tile_background.svg',
                      fit: BoxFit.fill,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 50.0.sp, vertical: 30.0.sp),
                      child:
                          Image.asset('assets/images/main_menu_tiles/hans.png'),
                    ),
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
                                  LoveMyselfTaskIntroScreen()));
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
