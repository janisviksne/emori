import 'dart:convert';
import 'dart:developer';

import 'package:emori/screens/questionnaire_screens/questionnaire_a_screen.dart';
import 'package:emori/utilities/constants/endpoint_constants.dart';
import 'package:emori/utilities/constants/text_constants/text_constants.dart';
import 'package:emori/utilities/constants/widget_constants/widget_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;

class QuestionnaireAIntroScreen extends StatefulWidget {
  final int userId;
  const QuestionnaireAIntroScreen(this.userId, {Key? key}) : super(key: key);

  @override
  State<QuestionnaireAIntroScreen> createState() => _QuestionnaireAIntroState();
}

class _QuestionnaireAIntroState extends State<QuestionnaireAIntroScreen> {
  @override
  Widget build(BuildContext context) {
    Future startQuestionnaireA(String endpoint) async {
      var response = await http.get(Uri.parse(endpoint),
          headers: {'Content-Type': 'application/json;charset=utf-8'});
      if (response.statusCode == 200) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => QuestionnaireAStartScreen(
                  jsonDecode(utf8.decode(response.bodyBytes))),
            ));
        log(response.body);
      } else {
        log(response.statusCode.toString());
      }
    }

    int userId = widget.userId;
    int questionNr = 1;
    return Scaffold(
      backgroundColor: kActiveYellow,
      body: SafeArea(
        child: Column(
          children: [
            kBackArrowGreen(context),
            Container(
              padding: EdgeInsets.only(left: 20.0.w, right: 20.0.w),
              child: Column(
                children: [
                  Row(
                    children: [
                      kInputTextHeading(
                          'Emocijas\nun garastāvoklis', kActiveGreen, 32)
                    ],
                  ),
                  kHeightSizedBox(30),
                  Stack(
                    children: [
                      Row(
                        children: [
                          kDescriptionText(
                              'Emociju regulācijas prasmju aptauja\nizvērtē to, cik veiksmīgi tu spēj\npārvaldīt savas izjūtas, sajūtas un\n'
                              'emocijas. Ir vairākas prasmes,\nun katra no tām ir būtiska.',
                              kActiveGreen,
                              18),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 75),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/images/questionnaire_backgrounds/questionnaire_intro_person.svg',
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 110.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              padding: EdgeInsets.only(top: 250.0.h),
                              iconSize: 100.0,
                              onPressed: () {
                                log(Endpoints.QUESTION_A_ENDPOINT +
                                    '$userId/$questionNr');
                                startQuestionnaireA(
                                    Endpoints.QUESTION_A_ENDPOINT +
                                        '$userId/$questionNr');
                              },
                              icon: SvgPicture.asset(
                                  'assets/images/common/forward_button_green.svg'),
                            ),
                          ],
                        ),
                      )
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
