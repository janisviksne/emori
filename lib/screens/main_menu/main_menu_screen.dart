import 'dart:developer';

import 'package:emori/utilities/constants/text_constants/auth_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
          child: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
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
            SizedBox(
              width: 300,
              height: 300,
              child: GridView.count(
                crossAxisCount: 2,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        log('CLICKED');
                      });
                    },
                    child: Container(
                      color: Colors.red,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
