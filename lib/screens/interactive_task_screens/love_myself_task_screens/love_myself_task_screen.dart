import 'package:emori/database_layer/love_myself_db/love_myself_answer_database.dart';
import 'package:emori/database_layer/love_myself_db/model/love_myself_entity.dart';
import 'package:emori/screens/interactive_task_screens/love_myself_task_screens/love_myself_task_description.dart';
import 'package:emori/utilities/constants/text_constants/text_constants.dart';
import 'package:emori/utilities/constants/widget_constants/widget_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/svg.dart';

import 'love_myself_completed_screen.dart';

class LoveMyselfTaskScreen extends StatefulWidget {
  const LoveMyselfTaskScreen({Key? key}) : super(key: key);

  @override
  State<LoveMyselfTaskScreen> createState() => _LoveMyselfTaskScreenState();
}

class _LoveMyselfTaskScreenState extends State<LoveMyselfTaskScreen> {
  late LMAnswerDatabase lmAnswerDatabase;

  @override
  void initState() {
    super.initState();
    $FloorLMAnswerDatabase
        .databaseBuilder('loveMyself_answer.db')
        .build()
        .then((value) => lmAnswerDatabase = value);
  }

  LoveMyselfAnswer loveMyselfAnswer = LoveMyselfAnswer(
      answerTitle1: '',
      answerTitle2: '',
      answerTitle3: '',
      answerTitle4: '',
      answerTitle5: '',
      answerTitle6: '',
      answerTitle7: '',
      answerTitle8: '',
      answerDateTime: '');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kActiveGreen,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0.w),
            child: Column(
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20.0.h),
                      child: kBackArrowYellow(context),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              LoveMyselfTaskDescriptionScreen()));
                                });
                              },
                              iconSize: 50.0,
                              icon: SvgPicture.asset(
                                  'assets/images/interactive_task_backgrounds/love_myself_task/yellow_info_icon.svg'))
                        ],
                      ),
                    )
                  ],
                ),
                kHeightSizedBox(20.0.h),
                Row(
                  children: [
                    kTextBoldMontagu('01', kActiveYellow, 32, true),
                  ],
                ),
                kHeightSizedBox(30.0.h),
                Row(
                  children: [
                    kDescriptionText('Es esmu ', kActiveYellow, 18),
                    SizedBox(
                      width: 230.w,
                      child: TextFormField(
                        obscureText: false,
                        controller: TextEditingController(
                            text: loveMyselfAnswer.answerTitle1),
                        onChanged: (val) {
                          loveMyselfAnswer.answerTitle1 = val;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Šis lauks nedrīkst būt tukšs!';
                          }
                        },
                        style:
                            const TextStyle(fontSize: 20, color: kActiveYellow),
                      ),
                    ),
                  ],
                ),
                kHeightSizedBox(30.0.h),
                Row(
                  children: [
                    kTextBoldMontagu('02', kActiveYellow, 32, true),
                  ],
                ),
                kHeightSizedBox(30.0.h),
                Row(
                  children: [
                    kDescriptionText('Man ir ', kActiveYellow, 18),
                    SizedBox(
                      width: 230.w,
                      child: TextFormField(
                        obscureText: false,
                        controller: TextEditingController(
                            text: loveMyselfAnswer.answerTitle2),
                        onChanged: (val) {
                          loveMyselfAnswer.answerTitle2 = val;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Šis lauks nedrīkst būt tukšs!';
                          }
                        },
                        style:
                            const TextStyle(fontSize: 20, color: kActiveYellow),
                      ),
                    ),
                  ],
                ),
                kHeightSizedBox(30.0.h),
                Row(
                  children: [
                    kTextBoldMontagu('03', kActiveYellow, 32, true),
                  ],
                ),
                kHeightSizedBox(30.0.h),
                Row(
                  children: [
                    kDescriptionText('Es esmu ', kActiveYellow, 18),
                    SizedBox(
                      width: 230.w,
                      child: TextFormField(
                        obscureText: false,
                        controller: TextEditingController(
                            text: loveMyselfAnswer.answerTitle3),
                        onChanged: (val) {
                          loveMyselfAnswer.answerTitle3 = val;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Šis lauks nedrīkst būt tukšs!';
                          }
                        },
                        style:
                            const TextStyle(fontSize: 20, color: kActiveYellow),
                      ),
                    ),
                  ],
                ),
                kHeightSizedBox(30.0.h),
                Row(
                  children: [
                    kTextBoldMontagu('04', kActiveYellow, 32, true),
                  ],
                ),
                kHeightSizedBox(30.0.h),
                Row(
                  children: [
                    kDescriptionText('Man ir ', kActiveYellow, 18),
                    SizedBox(
                      width: 230.w,
                      child: TextFormField(
                        obscureText: false,
                        controller: TextEditingController(
                            text: loveMyselfAnswer.answerTitle4),
                        onChanged: (val) {
                          loveMyselfAnswer.answerTitle4 = val;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Šis lauks nedrīkst būt tukšs!';
                          }
                        },
                        style:
                            const TextStyle(fontSize: 20, color: kActiveYellow),
                      ),
                    ),
                  ],
                ),
                kHeightSizedBox(30.0.h),
                Row(
                  children: [
                    kTextBoldMontagu('05', kActiveYellow, 32, true),
                  ],
                ),
                kHeightSizedBox(30.0.h),
                Row(
                  children: [
                    kDescriptionText('Es esmu ', kActiveYellow, 18),
                    SizedBox(
                      width: 230.w,
                      child: TextFormField(
                        obscureText: false,
                        controller: TextEditingController(
                            text: loveMyselfAnswer.answerTitle5),
                        onChanged: (val) {
                          loveMyselfAnswer.answerTitle5 = val;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Šis lauks nedrīkst būt tukšs!';
                          }
                        },
                        style:
                            const TextStyle(fontSize: 20, color: kActiveYellow),
                      ),
                    ),
                  ],
                ),
                kHeightSizedBox(30.0.h),
                Row(
                  children: [
                    kTextBoldMontagu('06', kActiveYellow, 32, true),
                  ],
                ),
                kHeightSizedBox(30.0.h),
                Row(
                  children: [
                    kDescriptionText('Man ir ', kActiveYellow, 18),
                    SizedBox(
                      width: 230.w,
                      child: TextFormField(
                        obscureText: false,
                        controller: TextEditingController(
                            text: loveMyselfAnswer.answerTitle6),
                        onChanged: (val) {
                          loveMyselfAnswer.answerTitle6 = val;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Šis lauks nedrīkst būt tukšs!';
                          }
                        },
                        style:
                            const TextStyle(fontSize: 20, color: kActiveYellow),
                      ),
                    ),
                  ],
                ),
                kHeightSizedBox(30.0.h),
                Row(
                  children: [
                    kTextBoldMontagu('07', kActiveYellow, 32, true),
                  ],
                ),
                kHeightSizedBox(30.0.h),
                Row(
                  children: [
                    kDescriptionText('Es esmu ', kActiveYellow, 18),
                    SizedBox(
                      width: 230.w,
                      child: TextFormField(
                        obscureText: false,
                        controller: TextEditingController(
                            text: loveMyselfAnswer.answerTitle7),
                        onChanged: (val) {
                          loveMyselfAnswer.answerTitle7 = val;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Šis lauks nedrīkst būt tukšs!';
                          }
                        },
                        style:
                            const TextStyle(fontSize: 20, color: kActiveYellow),
                      ),
                    ),
                  ],
                ),
                kHeightSizedBox(30.0.h),
                Row(
                  children: [
                    kTextBoldMontagu('08', kActiveYellow, 32, true),
                  ],
                ),
                kHeightSizedBox(30.0.h),
                Row(
                  children: [
                    kDescriptionText('Man ir ', kActiveYellow, 18),
                    SizedBox(
                      width: 230.w,
                      child: TextFormField(
                        obscureText: false,
                        controller: TextEditingController(
                            text: loveMyselfAnswer.answerTitle8),
                        onChanged: (val) {
                          loveMyselfAnswer.answerTitle8 = val;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Šis lauks nedrīkst būt tukšs!';
                          }
                        },
                        style:
                            const TextStyle(fontSize: 20, color: kActiveYellow),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(
                      iconSize: 100.0,
                      onPressed: () {
                        setState(() {
                          loveMyselfAnswer.answerDateTime =
                              DateTime.now().toString();
                          lmAnswerDatabase.loveMyselfAnswerDao
                              .insertLoveMyselfAnswer(loveMyselfAnswer);
                          print(loveMyselfAnswer.answerId);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      LoveMyselfTaskFinishScreen()));
                        });
                      },
                      icon: SvgPicture.asset(
                          'assets/images/common/forward_button_yellow.svg'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
