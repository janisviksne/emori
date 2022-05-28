import 'dart:convert';
import 'dart:developer';

import 'package:emori/request_model/user/login_user.dart';
import 'package:emori/screens/questionnaire_screens/questionnaire_b_screen.dart';
import 'package:emori/utilities/constants/endpoint_constants.dart';
import 'package:emori/utilities/constants/text_constants/text_constants.dart';
import 'package:emori/utilities/constants/widget_constants/widget_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;

class QuestionnaireBIntroScreen extends StatelessWidget {
  final LoginUser loginUser;
  const QuestionnaireBIntroScreen(this.loginUser, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future startQuestionnaireB(String endpoint) async {
      var response = await http.get(Uri.parse(endpoint),
          headers: {'Content-Type': 'application/json'});
      if (response.statusCode == 200) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => QuestionnaireBStartScreen(
                  jsonDecode(utf8.decode(response.bodyBytes))),
            ));
        log(response.body);
      } else {
        log(response.statusCode.toString());
      }
    }

    int questionNr = 1;
    return Scaffold(
      backgroundColor: kActiveYellow,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: 20.0, left: 20.0),
          child: Column(
            children: [
              kBackArrowGreen(context),
              Row(
                children: [
                  kInputTextHeading('Emociju\npiedzīvošana', kActiveGreen, 32)
                ],
              ),
              kHeightSizedBox(25.0),
              Row(
                children: [
                  kDescriptionText(
                      'Turpmākos jautājumos atzīmē\natbilstošākās atbildes dotajiem\napgalvojumiem',
                      kActiveGreen,
                      18)
                ],
              ),
              Expanded(
                child: Stack(
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/images/questionnaire_backgrounds/questionnaire_intro_person.svg',
                          fit: BoxFit.scaleDown,
                        ),
                      ],
                    ),
                    Padding(
                      //ToDo this can definitely be improved
                      padding: const EdgeInsets.only(top: 275.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            iconSize: 100.0,
                            onPressed: () {
                              startQuestionnaireB(
                                  Endpoints.QUESTION_B_ENDPOINT +
                                      '${loginUser.userId}/$questionNr');
                            },
                            icon: SvgPicture.asset(
                                'assets/images/common/forward_button_green.svg'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
