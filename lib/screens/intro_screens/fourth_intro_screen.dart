import 'package:emori/utilities/constants/text_constants/text_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'fifth_intro_screen.dart';

class FourthIntroScreen extends StatelessWidget {
  const FourthIntroScreen({Key? key}) : super(key: key);

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
                  children: [
                    SvgPicture.asset(
                      'assets/images/intro_backgrounds/fourth_intro/fourth_sun.svg',
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10.0, top: 10.0),
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
                  padding: const EdgeInsets.only(right: 20, top: 40),
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/images/intro_backgrounds/fourth_intro/fourth_intro_person.svg',
                    ),
                  ),
                )
              ],
            ),
            kHeightSizedBox(10.0),
            Container(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      kInputTextHeading('Uzdevumi', kActiveYellow, 32),
                    ],
                  ),
                  kHeightSizedBox(4),
                  Row(
                    children: [
                      kDescriptionText(
                          'Aizpildi uzdevumus, lai uzlabotu\nkonkr??tas emocijas regul??cijas prasmes.',
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
                                      const FifthIntroScreen()));
                        },
                        icon: SvgPicture.asset(
                            'assets/images/intro_backgrounds/fourth_intro/fourth_intro_forward_arrow_icon.svg'),
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
