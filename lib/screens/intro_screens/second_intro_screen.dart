import 'package:emori/screens/intro_screens/third_intro_screen.dart';
import 'package:emori/utilities/constants/text_constants/auth_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SecondIntroScreen extends StatelessWidget {
  const SecondIntroScreen({Key? key}) : super(key: key);

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
                  padding: const EdgeInsets.only(top: 165),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/images/intro_backgrounds/second_intro/second_sun.svg',
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(right: 20, top: 40),
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/images/intro_backgrounds/second_intro/second_intro_people.svg',
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
            kSizedBox(4.0),
            Container(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      kInputTextHeading('Aptaujas', kActiveYellow, 32),
                    ],
                  ),
                  kSizedBox(4),
                  Row(
                    children: [
                      kDescriptionText(
                          'Atbildi uz aptaujas jautājumiem par\nsavām emocijas regulācijas prasmēm,\nlai pielāgotu uzdevumus tieši Tev.',
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
                                      const ThirdIntroScreen()));
                        },
                        icon: SvgPicture.asset(
                            'assets/images/intro_backgrounds/second_intro/second_intro_forward_arrow_icon.svg'),
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
