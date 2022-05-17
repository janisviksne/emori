import 'dart:convert';
import 'dart:developer';

import 'package:emori/utilities/constants/endpoint_constants.dart';
import 'package:emori/utilities/constants/text_constants/auth_constants.dart';
import 'package:emori/utilities/utils/slider_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;

class QuestionnaireAStartScreen extends StatefulWidget {
  final dynamic response;
  const QuestionnaireAStartScreen(this.response, {Key? key}) : super(key: key);

  @override
  State<QuestionnaireAStartScreen> createState() =>
      _QuestionnaireAStartScreenState();
}

class _QuestionnaireAStartScreenState extends State<QuestionnaireAStartScreen> {
  //the entire questionnaireA DTO
  late var responseJson = widget.response;

  //question related data
  late var questionIdA = responseJson['questionnaireA']['questionIdA'];
  late var questionTitle = responseJson['questionnaireA']['questionTitle'];

  //user id
  late var userId = responseJson['userId'];

  //answer related data
  late var answerIdA = responseJson['answerA']['answerIdA'];
  late var answerTitle = responseJson['answerA']['answerTitle'];

  Future nextQuestion(String endpoint) async {
    var response = await http.get(Uri.parse(endpoint),
        headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QuestionnaireAStartScreen(
                jsonDecode(utf8.decode(response.bodyBytes))),
          ));
    } else {
      log(response.statusCode.toString());
    }
  }

  Future submitAnswer(int answerId, String answerTitle) async {
    var response = await http.post(Uri.parse(Endpoints.ANSWER_A_ENDPOINT),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'questionnaireA': {
            'questionIdA': questionNr,
            'questionTitle': questionTitle
          },
          'userId': userId,
          'answerA': {'answerIdA': answerId, 'answerTitle': answerTitle}
        }));
    log(response.body);
    if (response.statusCode == 200) {
      questionIdA++;
      log(Endpoints.QUESTION_A_ENDPOINT + '$userId/$questionIdA');
      nextQuestion(Endpoints.QUESTION_A_ENDPOINT + '$userId/$questionIdA');
    } else {
      log(response.statusCode.toString());
    }
  }

  int questionNr = 3;
  AnswerA answer = AnswerA(5, 'Nekad');
  double selectedAnswerValue = 0.0;

  String formatQuestion(int questionNr, String question) =>
      questionNr.toString() + '. ' + question;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kActiveYellow,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  iconSize: 50.0,
                  onPressed: () {
                    setState(() {
                      questionNr--;
                      Navigator.pop(context);
                    });
                  },
                  icon: SvgPicture.asset(
                      'assets/images/common/back_arrow_green.svg'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                kInputTextHeading(
                    formatQuestion(questionNr, questionTitle), kActiveGreen, 28)
              ],
            ),
            kSizedBox(20.0),
            Center(
                child: kInputTextHeading(
                    SliderUtils.labelValue(selectedAnswerValue).answerTitle,
                    kActiveGreen,
                    22)),
            kSizedBox(20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 300,
                  child: RotatedBox(
                    quarterTurns: 3,
                    child: SliderTheme(
                      data: const SliderThemeData(
                        trackHeight: 80,
                      ),
                      child: Slider(
                        divisions: 4,
                        label: '',
                        min: 0.0,
                        max: 20.0,
                        activeColor: kActiveGreen,
                        value: selectedAnswerValue,
                        onChanged: (newValue) {
                          setState(() {
                            selectedAnswerValue = newValue;
                            answerTitle =
                                SliderUtils.labelValue(selectedAnswerValue)
                                    .answerTitle;
                            answerIdA =
                                SliderUtils.labelValue(selectedAnswerValue)
                                    .answerId;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    iconSize: 100.0,
                    onPressed: () {
                      submitAnswer(answerIdA, answerTitle);
                    },
                    icon: SvgPicture.asset(
                        'assets/images/common/active_forward_button_green.svg'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
