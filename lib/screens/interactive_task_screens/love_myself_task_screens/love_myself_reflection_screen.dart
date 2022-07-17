import 'package:emori/database_layer/love_myself_reflection_db/love_myself_reflection_model.dart';
import 'package:emori/utilities/constants/text_constants/text_constants.dart';
import 'package:emori/utilities/constants/widget_constants/widget_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/svg.dart';

import '../../../database_layer/database.dart';
import 'love_myself_final_screen.dart';

class LoveMyselfReflectionScreen extends StatefulWidget {
  const LoveMyselfReflectionScreen({Key? key}) : super(key: key);

  @override
  State<LoveMyselfReflectionScreen> createState() =>
      _LoveMyselfReflectionScreenState();
}

class _LoveMyselfReflectionScreenState
    extends State<LoveMyselfReflectionScreen> {
  late ReflectionAnswerDatabase lmAnswerDatabase;

  @override
  void initState() {
    super.initState();
    $FloorReflectionAnswerDatabase
        .databaseBuilder('database.db')
        .build()
        .then((value) => lmAnswerDatabase = value);
  }

  @override
  Widget build(BuildContext context) {
    LoveMyselfReflection loveMyselfReflection =
        LoveMyselfReflection(answerTitle1: '', answerDateTime: '');
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
                        child: kDescriptionText('1/1', kActiveGreen, 16)),
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
                                          FinalLoveMyselfScreen()));
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
                  kInputTextHeading('Ko Tu sevī pamanīji,\nveicot uzdevumu?',
                      kActiveGreen, 30),
                ],
              ),
              kHeightSizedBox(40.0.h),
              TextFormField(
                obscureText: false,
                controller: TextEditingController(
                    text: loveMyselfReflection.answerTitle1),
                onChanged: (val) {
                  loveMyselfReflection.answerTitle1 = val;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Šis lauks nedrīkst būt tukšs!';
                  }
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
                        lmAnswerDatabase.loveMyselfReflectionDao
                            .insertLMReflectionAnswer(loveMyselfReflection);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FinalLoveMyselfScreen()));
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
