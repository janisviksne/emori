import 'package:emori/screens/interactive_task_screens/spiral_task_screens/spiral_task_reflection_screens/spiral_task_reflection_screen2.dart';
import 'package:emori/utilities/constants/text_constants/text_constants.dart';
import 'package:emori/utilities/constants/widget_constants/widget_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/svg.dart';

class SpiralTaskReflectionScreen1 extends StatefulWidget {
  const SpiralTaskReflectionScreen1({Key? key}) : super(key: key);

  @override
  State<SpiralTaskReflectionScreen1> createState() =>
      _SpiralTaskReflectionScreen1State();
}

class _SpiralTaskReflectionScreen1State
    extends State<SpiralTaskReflectionScreen1> {
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
                        child: kDescriptionText('1/3', kActiveGreen, 16)),
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
                                          SpiralTaskReflectionScreen2()));
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
                  kInputTextHeading('Ko Tu sevī pamanīji,\nveicot šo uzdevumu?',
                      kActiveGreen, 30),
                ],
              ),
              kHeightSizedBox(40.0.h),
              TextFormField(
                obscureText: false,
                controller: TextEditingController(text: tempValue),
                onChanged: (val) {
                  tempValue = val;
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
                                    SpiralTaskReflectionScreen2()));
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
