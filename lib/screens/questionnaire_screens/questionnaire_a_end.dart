import 'package:emori/screens/questionnaire_screens/questionnaire_b_intro.dart';
import 'package:emori/utilities/constants/text_constants/text_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../size_config.dart';

class QuestionnaireAEndScreen extends StatelessWidget {
  final int userId;
  const QuestionnaireAEndScreen(this.userId, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: kActiveGreen,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: 20.0, left: 20.0),
          child: Column(
            children: [
              Container(
                padding:
                    EdgeInsets.only(top: SizeConfig.blockSizeVertical! * 10),
                child: Row(
                  children: [
                    kInputTextHeading(
                        'Paldies,\naptauja izpildīta!', kActiveYellow, 32)
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/images/questionnaire_backgrounds/questionnaire_done_person.svg',
                    height: SizeConfig.screenHeight! * 0.6,
                    width: SizeConfig.screenWidth! * 0.8,
                  )
                ],
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      iconSize: 100.0,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  QuestionnaireBIntroScreen(userId),
                            ));
                      },
                      icon: SvgPicture.asset(
                          'assets/images/common/forward_button_yellow.svg'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
