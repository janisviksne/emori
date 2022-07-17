import 'package:emori/screens/interactive_task_screens/thank_you_finish_screen.dart';
import 'package:emori/utilities/constants/text_constants/text_constants.dart';
import 'package:emori/utilities/constants/widget_constants/widget_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../database_layer/database.dart';
import '../../../../database_layer/spiral_task_reflection_db/spiral_task_reflection_model.dart';

class SpiralTaskReflectionScreen3 extends StatefulWidget {
  final SpiralTaskReflection spiralTaskReflection;
  const SpiralTaskReflectionScreen3(this.spiralTaskReflection, {Key? key})
      : super(key: key);

  @override
  State<SpiralTaskReflectionScreen3> createState() =>
      _SpiralTaskReflectionScreen3State();
}

class _SpiralTaskReflectionScreen3State
    extends State<SpiralTaskReflectionScreen3> {
  late ReflectionAnswerDatabase spiralReflectionAnswers;

  @override
  void initState() {
    super.initState();
    $FloorReflectionAnswerDatabase
        .databaseBuilder('database.db')
        .build()
        .then((value) => spiralReflectionAnswers = value);
  }

  late SpiralTaskReflection spiralTaskReflection = widget.spiralTaskReflection;
  @override
  Widget build(BuildContext context) {
    //ToDo add database entity that stores this value
    //initialize dao to save the input answer
    String tempValue = '';
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
                        child: kDescriptionText('3/3', kActiveGreen, 16)),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 25.0.h, horizontal: 15.0.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                            onTap: () {
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
                      'Lūdzu, iedod,\nnosaukumu darbam!', kActiveGreen, 30),
                ],
              ),
              kHeightSizedBox(40.0.h),
              TextFormField(
                controller: TextEditingController(
                    text: spiralTaskReflection.answerTitle3),
                onChanged: (val) {
                  spiralTaskReflection.answerTitle3 = val;
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
                        spiralTaskReflection.answerDateTime =
                            DateTime.now().toString();
                        spiralReflectionAnswers.spiralTaskReflectionDao
                            .insertDrawTaskReflectionAnswer(
                                spiralTaskReflection);
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
