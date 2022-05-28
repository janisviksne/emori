import 'package:emori/utilities/constants/text_constants/text_constants.dart';
import 'package:emori/utilities/constants/widget_constants/widget_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../database_layer/draw_task_reflection_db/draw_task_reflection_model.dart';
import 'drawing_task_reflection_screen5.dart';

class DrawingTaskReflectionScreen4 extends StatefulWidget {
  final DrawTaskReflection drawTaskReflection;
  const DrawingTaskReflectionScreen4(this.drawTaskReflection, {Key? key})
      : super(key: key);

  @override
  State<DrawingTaskReflectionScreen4> createState() =>
      _DrawingTaskReflectionScreen4State();
}

class _DrawingTaskReflectionScreen4State
    extends State<DrawingTaskReflectionScreen4> {
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
                        child: kDescriptionText('4/5', kActiveGreen, 16)),
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
                                          DrawingTaskReflectionScreen5(
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
                      'Kā Tas varētu būt\nsaistīts ar Tavu\npēdējā laika\nnoskaņojumu?',
                      kActiveGreen,
                      30),
                ],
              ),
              kHeightSizedBox(40.0.h),
              TextFormField(
                obscureText: false,
                controller: TextEditingController(
                    text: drawTaskReflection.answerTitle4),
                onChanged: (val) {
                  drawTaskReflection.answerTitle4 = val;
                },
                style: const TextStyle(fontSize: 20, color: kActiveGreen),
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
                        //ToDo submit answer database
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    DrawingTaskReflectionScreen5(
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
