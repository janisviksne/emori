import 'package:emori/intro_screens/second_intro_screen.dart';
import 'package:emori/utilities/constants/text_constants/auth_constants.dart';
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
                        'assets/images/intro_backgrounds/first_intro/small_sun.svg',
                        width: 80,
                        height: 210,
                        color: Colors.orange,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(right: 20),
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/images/intro_backgrounds/first_intro/people.svg',
                    ),
                  ),
                )
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
                  kSizedBox(2.5),
                  Row(
                    children: [
                      kDescriptionText(
                          'Šis palīdzēs uzlabot emociju\npārvaldīšanas (regulācijas) prasmes,\nizmantojot pašpalīdzības metodes.',
                          kActiveYellow,
                          18),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                    iconSize: 75.0,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SecondIntroScreen()));
                    },
                    icon: SvgPicture.asset(
                        'assets/images/common/intro_proceed_arrow_button.svg'),
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
