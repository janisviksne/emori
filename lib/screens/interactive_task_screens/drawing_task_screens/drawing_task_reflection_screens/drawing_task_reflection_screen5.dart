import 'package:emori/screens/interactive_task_screens/thank_you_finish_screen.dart';
import 'package:emori/utilities/constants/text_constants/text_constants.dart';
import 'package:emori/utilities/constants/widget_constants/widget_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../database_layer/database.dart';
import '../../../../database_layer/draw_task_reflection_db/draw_task_reflection_model.dart';

class DrawingTaskReflectionScreen5 extends StatefulWidget {
  final DrawTaskReflection drawTaskReflection;
  const DrawingTaskReflectionScreen5(this.drawTaskReflection, {Key? key})
      : super(key: key);

  @override
  State<DrawingTaskReflectionScreen5> createState() =>
      _DrawingTaskReflectionScreen5State();
}

class _DrawingTaskReflectionScreen5State
    extends State<DrawingTaskReflectionScreen5> {
  late ReflectionAnswerDatabase drawTaskReflectionAnswers;

  @override
  void initState() {
    super.initState();
    $FloorReflectionAnswerDatabase
        .databaseBuilder('database.db')
        .build()
        .then((value) => drawTaskReflectionAnswers = value);
  }

  @override
  Widget build(BuildContext context) {
    late DrawTaskReflection drawTaskReflection = widget.drawTaskReflection;
    return Scaffold(
      backgroundColor: kActiveYellow,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w),
          child: Column(
            children: [
              kHeightSizedBox(20.0.h),
              Stack(
                children: [
                  kBackArrowGreen(context),
                  Center(
                    child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.0.h),
                        child: kDescriptionText('5/5', kActiveGreen, 16)),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 25.0.h, horizontal: 15.0.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                            onTap: () {
                              //ToDo check if image is passable to another screen
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          FinishThankYouScreen()));
                            },
                            child:
                                kDescriptionText('Izlaist', kActiveGreen, 15)),
                      ],
                    ),
                  )
                ],
              ),
              kHeightSizedBox(10.0.h),
              Row(
                children: [
                  kInputTextHeading(
                      'Lūdzu iedod\nnosaukumu darbam!', kActiveGreen, 30),
                ],
              ),
              kHeightSizedBox(40.0.h),
              TextFormField(
                obscureText: false,
                controller: TextEditingController(
                    text: drawTaskReflection.answerTitle5),
                onChanged: (val) {
                  drawTaskReflection.answerTitle5 = val;
                },
                style: TextStyle(fontSize: 20, color: kActiveGreen),
                decoration: kInputFieldDecoration('', kActiveGreen),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      iconSize: 100.0,
                      onPressed: () {
                        drawTaskReflection.answerDateTime =
                            DateTime.now().toString();
                        drawTaskReflectionAnswers.drawTaskReflectionDao
                            .insertDrawTaskReflectionAnswer(drawTaskReflection);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FinishThankYouScreen()));
                      },
                      icon: SvgPicture.asset(
                          'assets/images/common/forward_button_green.svg'),
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
