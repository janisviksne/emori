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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  'assets/images/intro_backgrounds/first_intro/sun.svg',
                  color: Colors.orange,
                ),
                SvgPicture.asset(
                  'assets/images/intro_backgrounds/first_intro/people.svg',
                  height: 415,
                  fit: BoxFit.fill,
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
              padding: const EdgeInsets.only(right: 10.0),
              child: Expanded(
                child: Row(
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
                                    const SecondIntroScreen()));
                      },
                      icon: SvgPicture.asset(
                          'assets/images/common/arrow_button.svg'),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
