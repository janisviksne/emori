import 'dart:developer';

import 'package:emori/screens/interactive_task_screens/drawing_task_screens/drawing_task_description.dart';
import 'package:emori/screens/interactive_task_screens/love_myself_task_screens/love_myself_task_description.dart';
import 'package:emori/utilities/constants/text_constants/text_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'interactive_task_screens/54321_task_screens/54321_task_description_screen.dart';
import 'interactive_task_screens/spiral_task_screens/spiral_task_description.dart';

class MainMenuScreen extends StatefulWidget {
  const MainMenuScreen({Key? key}) : super(key: key);

  @override
  State<MainMenuScreen> createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kActiveYellow,
      body: SafeArea(
          child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SvgPicture.asset('assets/images/common/emori_logo.svg')
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0.w),
            child: Row(
              children: [
                kInputTextHeading('Uzdevumi', kActiveGreen, 26),
              ],
            ),
          ),
          SizedBox(
            height: 500.h,
            child: GridView.count(
              crossAxisCount: 2,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 10.0.h, horizontal: 10.0.w),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const DrawingTaskDescriptionScreen()));
                        log('CLICKED1');
                      });
                    },
                    child: SvgPicture.asset(
                      'assets/images/main_menu_tiles/draw_task_tile.svg',
                      fit: BoxFit.contain,
                      width: 160.w,
                      height: 160.h,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 10.0.h, horizontal: 10.0.w),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const SpiralTaskDescriptionScreen()));
                      });
                    },
                    child: SvgPicture.asset(
                      'assets/images/main_menu_tiles/spiral_task_tile.svg',
                      fit: BoxFit.contain,
                      width: 160.w,
                      height: 160.h,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const LoveMyselfTaskDescriptionScreen()));
                    });
                  },
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0.h, horizontal: 10.0.w),
                        child: SvgPicture.asset(
                          'assets/images/main_menu_tiles/love_myself_tile.svg',
                          fit: BoxFit.contain,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 40.0.w, vertical: 15.0.h),
                        child: Image.asset(
                          'assets/images/main_menu_tiles/hans.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 10.0.h, horizontal: 10.0.w),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    FiveNumberTaskDescriptionScreen()));
                        log('CLICKED1');
                      });
                    },
                    child: SvgPicture.asset(
                      'assets/images/main_menu_tiles/54321_task_tile.svg',
                      fit: BoxFit.contain,
                      width: 160.w,
                      height: 160.h,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
