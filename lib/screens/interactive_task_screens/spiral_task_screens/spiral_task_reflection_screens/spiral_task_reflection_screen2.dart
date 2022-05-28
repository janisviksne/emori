import 'package:emori/database_layer/spiral_task_reflection_db/spiral_task_reflection_model.dart';
import 'package:emori/screens/interactive_task_screens/spiral_task_screens/spiral_task_reflection_screens/spiral_task_reflection_screen3.dart';
import 'package:emori/utilities/constants/text_constants/text_constants.dart';
import 'package:emori/utilities/constants/widget_constants/widget_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/svg.dart';

class SpiralTaskReflectionScreen2 extends StatefulWidget {
  final SpiralTaskReflection spiralTaskReflection;
  const SpiralTaskReflectionScreen2(this.spiralTaskReflection, {Key? key})
      : super(key: key);

  @override
  State<SpiralTaskReflectionScreen2> createState() =>
      _SpiralTaskReflectionScreen2State();
}

class _SpiralTaskReflectionScreen2State
    extends State<SpiralTaskReflectionScreen2> {
  @override
  Widget build(BuildContext context) {
    late SpiralTaskReflection spiralTaskReflection =
        widget.spiralTaskReflection;
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
                        child: kDescriptionText('2/3', kActiveGreen, 16)),
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
                                          SpiralTaskReflectionScreen3(
                                              spiralTaskReflection)));
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
                      'Ko Tev nozīmē šie,\nsimboli, krāsas, vārdi?',
                      kActiveGreen,
                      30),
                ],
              ),
              kHeightSizedBox(40.0.h),
              TextFormField(
                controller: TextEditingController(
                    text: spiralTaskReflection.answerTitle2),
                onChanged: (val) {
                  spiralTaskReflection.answerTitle2 = val;
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    SpiralTaskReflectionScreen3(
                                        spiralTaskReflection)));
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
