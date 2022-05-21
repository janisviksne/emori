import 'package:emori/screens/intro_screens/second_intro_screen.dart';
import 'package:emori/utilities/constants/text_constants/text_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FirstIntroScreen extends StatelessWidget {
  const FirstIntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kActiveGreen,
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 240),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/images/intro_backgrounds/first_intro/first_sun.svg',
                        height: 210,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(right: 20),
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/images/intro_backgrounds/first_intro/first_intro_people.svg',
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      kInputTextHeading('Sveicināti Emori!', kActiveYellow, 32),
                    ],
                  ),
                  kHeightSizedBox(2.5),
                ],
              ),
            ),
            Stack(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Row(
                    children: [
                      kDescriptionText(
                          'Šis palīdzēs uzlabot emociju\npārvaldīšanas (regulācijas) prasmes,\nizmantojot pašpalīdzības metodes.',
                          kActiveYellow,
                          18),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      padding: const EdgeInsets.only(top: 60.0, right: 30.0),
                      iconSize: 100.0,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const SecondIntroScreen()));
                      },
                      icon: SvgPicture.asset(
                          'assets/images/intro_backgrounds/first_intro/first_intro_forward_arrow_icon.svg'),
                    ),
                  ],
                ),
              ],
            )
            // Expanded(
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.end,
            //     crossAxisAlignment: CrossAxisAlignment.end,
            //     children: [
            //       IconButton(
            //         iconSize: 100.0,
            //         onPressed: () {
            //           Navigator.push(
            //               context,
            //               MaterialPageRoute(
            //                   builder: (context) => const SecondIntroScreen()));
            //         },
            //         icon: SvgPicture.asset(
            //             'assets/images/intro_backgrounds/first_intro/first_intro_forward_arrow_icon.svg'),
            //       ),
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
