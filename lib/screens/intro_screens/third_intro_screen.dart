import 'package:emori/utilities/constants/text_constants/auth_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'fourth_intro_screen.dart';

class ThirdIntroScreen extends StatelessWidget {
  const ThirdIntroScreen({Key? key}) : super(key: key);

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
                  padding: const EdgeInsets.only(top: 80),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/images/intro_backgrounds/third_intro/third_sun.svg',
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(right: 75, top: 20),
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/images/intro_backgrounds/third_intro/third_intro_person.svg',
                    ),
                  ),
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
              ],
            ),
            kSizedBox(10.0),
            Container(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      kInputTextHeading('Garastāvoklis', kActiveYellow, 32),
                    ],
                  ),
                  kSizedBox(4),
                  Row(
                    children: [
                      kDescriptionText(
                          'Garastāvokļa novērošana\nregulāri atzīmē, kā jūties.',
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
                                      const FourthIntroScreen()));
                        },
                        icon: SvgPicture.asset(
                            'assets/images/intro_backgrounds/third_intro/third_intro_forward_arrow_icon.svg'),
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
