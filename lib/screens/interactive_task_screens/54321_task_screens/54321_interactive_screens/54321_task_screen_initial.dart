import 'package:emori/utilities/constants/text_constants/text_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utilities/constants/widget_constants/widget_constants.dart';
import '../../../../utilities/widgets/task_widgets/white_container_button.dart';
import '54321_task_screen_audio.dart';
import '54321_task_screen_text.dart';

class FiveNumberTaskFirstScreen extends StatefulWidget {
  const FiveNumberTaskFirstScreen({Key? key}) : super(key: key);

  @override
  State<FiveNumberTaskFirstScreen> createState() =>
      _FiveNumberTaskFirstScreenState();
}

class _FiveNumberTaskFirstScreenState extends State<FiveNumberTaskFirstScreen> {
  int _value = 1;
  String taskType = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w),
          child: Column(
            children: [
              kBackArrowGreen(context),
              kHeightSizedBox(10.0.h),
              Row(
                children: [
                  kInputTextHeading(
                      'Izvēlies, kā\npildīsi uzdevumu', kActiveGreen, 30),
                ],
              ),
              kHeightSizedBox(25.0.h),
              Row(
                children: [
                  kDescriptionText(
                      'Tev tiks dota uzdevuma instrukcija kādā\nno šīm divām piedāvātajām formām',
                      kActiveGreen,
                      16),
                ],
              ),
              kHeightSizedBox(40.0),
              Column(
                children: [
                  WhiteContainerButton<int>(
                    value: 1,
                    groupValue: _value,
                    title: 'tekstuāli',
                    onChanged: (value) => setState(() {
                      taskType = 'tekstuāli';
                      _value = value!;
                    }),
                  ),
                  kHeightSizedBox(20.0),
                  WhiteContainerButton<int>(
                    value: 2,
                    groupValue: _value,
                    title: 'audiāli',
                    onChanged: (value) => setState(() {
                      taskType = 'audiāli';
                      _value = value!;
                    }),
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => taskType == 'audiāli'
                                    ? FiveNumberTaskScreenAudio()
                                    : FiveNumberTaskScreenText()));
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
