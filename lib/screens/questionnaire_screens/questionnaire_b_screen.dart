import 'dart:convert';
import 'dart:developer';

import 'package:dotted_border/dotted_border.dart';
import 'package:emori/utilities/constants/endpoint_constants.dart';
import 'package:emori/utilities/constants/text_constants/auth_constants.dart';
import 'package:emori/utilities/widgets/questionnaire_widgets/yellow_container_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;

class QuestionnaireBStartScreen extends StatefulWidget {
  final dynamic response;
  const QuestionnaireBStartScreen(this.response, {Key? key}) : super(key: key);

  @override
  State<QuestionnaireBStartScreen> createState() =>
      _QuestionnaireBStartScreenState();
}

class _QuestionnaireBStartScreenState extends State<QuestionnaireBStartScreen> {
  int getAnswerBId(String title) {
    if (title == '(gandrīz) vienmēr') {
      return 1;
    } else if (title == 'bieži') {
      return 2;
    } else if (title == 'dažreiz') {
      return 3;
    } else if (title == 'reti') {
      return 4;
    } else {
      return 5;
    }
  }

  late var responseJson = widget.response;

  //question related data
  late var questionIdB = responseJson['questionnaireB']['questionIdB'];
  late var questionTitle = responseJson['questionnaireB']['questionTitle'];

  //user id
  late var userId = responseJson['userId'];

  //answer related data
  late int answerIdB = responseJson['answerB']['answerIdB'];
  late var answerTitle = responseJson['answerB']['answerTitle'];

  Future nextQuestion(String endpoint) async {
    var response = await http.get(Uri.parse(endpoint),
        headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QuestionnaireBStartScreen(
                jsonDecode(utf8.decode(response.bodyBytes))),
          ));
    } else {
      log(response.statusCode.toString());
    }
  }

  Future submitAnswerB(int answerId, String answerTitle) async {
    var response = await http.post(Uri.parse(Endpoints.ANSWER_B_ENDPOINT),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'questionnaireB': {
            'questionIdB': questionIdB,
            'questionTitle': questionTitle
          },
          'userId': userId,
          'answerB': {'answerIdB': answerId, 'answerTitle': answerTitle}
        }));

    if (response.statusCode == 200) {
      log(response.body);
      questionIdB++;

      log(Endpoints.QUESTION_B_ENDPOINT + '$userId/$questionIdB');
      nextQuestion(Endpoints.QUESTION_B_ENDPOINT + '$userId/$questionIdB');
    } else {
      log(response.statusCode.toString());
    }
  }

  String draggedValue = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kActiveYellow,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: 20.0, left: 20.0),
          child: Column(
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        kQuestionCounter(
                            questionIdB.toString() + '/27', kActiveGreen),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        iconSize: 50.0,
                        onPressed: () {
                          setState(() {
                            questionIdB--;
                            Navigator.pop(context);
                          });
                        },
                        icon: SvgPicture.asset(
                            'assets/images/common/back_arrow_green.svg'),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [kQuestionIntro('Pagājušajā nedēļā es')],
              ),
              kSizedBox(10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [kQuestionText(questionTitle, kActiveGreen, 20)],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              DragTarget<String>(
                builder: (context, data, rejectedData) {
                  return DottedBorder(
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(12),
                    padding: const EdgeInsets.all(6),
                    color: kActiveGreen,
                    strokeWidth: 2,
                    dashPattern: const [8],
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      child: Container(
                        height: 55,
                        width: 210,
                        color: kActiveYellow,
                        child: draggedValue == ''
                            ? null
                            : YellowContainerButton(title: draggedValue),
                      ),
                    ),
                  );
                },
                onAccept: (activeValue) {
                  setState(() {
                    draggedValue = activeValue;
                    answerTitle = activeValue;
                    answerIdB = getAnswerBId(answerTitle);

                    log(answerIdB.toString());
                    log(answerTitle);
                  });
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              const Draggable(
                  data: '(gandrīz) vienmēr',
                  child: YellowContainerButton(
                    title: '(gandrīz) vienmēr',
                  ),
                  feedback: YellowContainerButton(title: '(gandrīz) vienmēr')),
              kSizedBox(5.0),
              const Draggable(
                  data: 'bieži',
                  child: YellowContainerButton(title: 'bieži'),
                  feedback: YellowContainerButton(title: 'bieži')),
              kSizedBox(5.0),
              const Draggable(
                  data: 'dažreiz',
                  child: YellowContainerButton(
                    title: 'dažreiz',
                  ),
                  feedback: YellowContainerButton(title: 'dažreiz')),
              kSizedBox(5.0),
              const Draggable(
                  data: 'reti',
                  child: YellowContainerButton(
                    title: 'reti',
                  ),
                  feedback: YellowContainerButton(title: 'reti')),
              kSizedBox(5.0),
              const Draggable(
                  data: 'nekad',
                  child: YellowContainerButton(
                    title: 'nekad',
                  ),
                  feedback: YellowContainerButton(title: 'nekad')),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      iconSize: 100.0,
                      onPressed: () {
                        submitAnswerB(answerIdB, answerTitle);
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
      ),
    );
  }
}
