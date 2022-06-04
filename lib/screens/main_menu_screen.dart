import 'dart:developer';

import 'package:emori/screens/interactive_task_screens/drawing_task_screens/drawing_task_description.dart';
import 'package:emori/screens/interactive_task_screens/love_myself_task_screens/love_myself_task_description.dart';
import 'package:emori/utilities/constants/text_constants/text_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
                  padding: const EdgeInsets.all(12.0),
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
                      'assets/images/main_menu_tiles/drawing_task_tile.svg',
                      fit: BoxFit.contain,
                      width: 160.w,
                      height: 160.h,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
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
                        padding: const EdgeInsets.all(12.0),
                        child: SvgPicture.asset(
                          'assets/images/common/green_tile_background.svg',
                          fit: BoxFit.contain,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(35.0.sp),
                        child: Image.asset(
                          'assets/images/main_menu_tiles/hans.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20.w, top: 165.h),
                        child: Row(
                          children: [
                            kTextBoldReadex(
                                'Es sev\npatīku', kActiveYellow, 16, true)
                          ],
                        ),
                      ),
                    ],
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
