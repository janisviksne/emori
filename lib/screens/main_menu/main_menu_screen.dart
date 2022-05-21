import 'dart:developer';

import 'package:emori/screens/interactive_task_screens/drawing_task_screens/drawing_task_intro_screens/drawing_task_description.dart';
import 'package:emori/size_config.dart';
import 'package:emori/utilities/constants/text_constants/text_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainMenuScreen extends StatefulWidget {
  const MainMenuScreen({Key? key}) : super(key: key);

  @override
  State<MainMenuScreen> createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
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
          kHeightSizedBox(20.0),
          SizedBox(
            height: 500,
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        //ToDo implement drawing intros
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
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        //ToDo add navigator leading to spiral intros + task
                        log('Test2');
                      });
                    },
                    child: SvgPicture.asset(
                      'assets/images/main_menu_tiles/spiral_task_tile.svg',
                      fit: BoxFit.contain,
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
