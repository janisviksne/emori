import 'package:emori/screens/auth_screens/temporary.dart';
import 'package:emori/utilities/constants/text_constants/auth_constants.dart';
import 'package:emori/utilities/constants/widget_constants/widget_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class QuestionnaireAIntroScreen extends StatelessWidget {
  const QuestionnaireAIntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kActiveYellow,
      body: SafeArea(
          child: Column(
        children: [
          kBackArrowGreen(context),
          Container(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Column(
              children: [
                Row(
                  children: [
                    kInputTextHeading(
                        'Emocijas\nun garastāvoklis', kActiveGreen, 32)
                  ],
                ),
                kSizedBox(30),
                Row(
                  children: [
                    kDescriptionText(
                        'Emociju regulācijas prasmju aptauja\nizvērtē to, cik veiksmīgi tu spēj\npārvaldīt savas izjūtas, sajūtas un\n'
                        'emocijas. Ir vairākas prasmes,\nun katra no tām ir būtiska.',
                        kActiveGreen,
                        18),
                  ],
                ),
                Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/images/questionnaire_backgrounds/questionnaire_intro_person.svg',
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          padding: const EdgeInsets.only(top: 250.0),
                          iconSize: 100.0,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const TempScreen()));
                          },
                          icon: SvgPicture.asset(
                              'assets/images/common/active_forward_button_green.svg'),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
