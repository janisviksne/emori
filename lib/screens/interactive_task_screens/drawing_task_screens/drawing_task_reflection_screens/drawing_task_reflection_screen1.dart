import 'package:emori/database_layer/draw_task_reflection_db/draw_task_reflection_model.dart';
import 'package:emori/utilities/constants/text_constants/text_constants.dart';
import 'package:emori/utilities/constants/widget_constants/widget_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/svg.dart';

import 'drawing_task_reflection_screen2.dart';

class DrawingTaskReflectionScreen1 extends StatefulWidget {
  const DrawingTaskReflectionScreen1({Key? key}) : super(key: key);

  @override
  State<DrawingTaskReflectionScreen1> createState() =>
      _DrawingTaskReflectionScreen1State();
}

class _DrawingTaskReflectionScreen1State
    extends State<DrawingTaskReflectionScreen1> {
  @override
  Widget build(BuildContext context) {
    DrawTaskReflection drawTaskReflection = DrawTaskReflection(
        answerTitle1: '',
        answerTitle2: '',
        answerTitle3: '',
        answerTitle4: '',
        answerTitle5: '',
        answerDateTime: '');

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
                        child: kDescriptionText('1/5', kActiveGreen, 16)),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 25.0.h, horizontal: 15.0.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                            onTap: () {
                              //ToDo after describing everything check if i can pass image around
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          DrawingTaskReflectionScreen2(
                                              drawTaskReflection)));
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
                      'Kādas izjūtas\nraisījās, švīkājot?', kActiveGreen, 30),
                ],
              ),
              kHeightSizedBox(40.0.h),
              TextFormField(
                obscureText: false,
                controller: TextEditingController(
                    text: drawTaskReflection.answerTitle1),
                onChanged: (val) {
                  drawTaskReflection.answerTitle1 = val;
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    DrawingTaskReflectionScreen2(
                                        drawTaskReflection)));
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
