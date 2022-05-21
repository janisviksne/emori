import 'package:emori/screens/registration_screens/email_password_screen.dart';
import 'package:emori/utilities/constants/text_constants/text_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/svg.dart';

class FifthIntroScreen extends StatelessWidget {
  const FifthIntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kActiveGreen,
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SvgPicture.asset(
                      'assets/images/intro_backgrounds/fifth_intro/fifth_sun.svg',
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(left: 10.0.w, top: 10.0.h),
                  child: Row(
                    children: [
                      IconButton(
                        iconSize: 50.0,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: SvgPicture.asset(
                            'assets/images/common/back_arrow_yellow.svg'),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 20.w, top: 60.h),
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/images/intro_backgrounds/fifth_intro/fifth_intro_person.svg',
                      height: 350,
                    ),
                  ),
                ),
              ],
            ),
            kHeightSizedBox(5.0),
            Container(
              padding:
                  EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 20.0.w),
              child: Column(
                children: [
                  Row(
                    children: [
                      kInputTextHeading('Motivācija', kActiveYellow, 32),
                    ],
                  ),
                  kHeightSizedBox(4),
                  Row(
                    children: [
                      kDescriptionText(
                          'Par uzdevumiem saņemsi virtuālus\nžetonus. Tie apliecinās emociju\nregulācijas prasmju iepazīšanu un attīstību.',
                          kActiveYellow,
                          18),
                    ],
                  ),
                  Row(
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
                                      const EmailPasswordScreen()));
                        },
                        icon: SvgPicture.asset(
                            'assets/images/intro_backgrounds/fifth_intro/fifth_intro_forward_arrow_icon.svg'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
