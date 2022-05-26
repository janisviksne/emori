import 'package:emori/utilities/constants/text_constants/text_constants.dart';
import 'package:emori/utilities/constants/widget_constants/widget_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SpiralTaskIntroScreen extends StatelessWidget {
  const SpiralTaskIntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kActiveGreen,
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20.0.w, top: 20.0.h),
                  child: Row(
                    children: [
                      kBackArrowYellow(context),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SvgPicture.asset(
                      'assets/images/interactive_task_backgrounds/spiral_task/spiral_intro_sun.svg',
                      height: 460.h,
                    )
                  ],
                )
              ],
            ),
            Center(child: kInputTextHeading('Papildini', kActiveYellow, 30)),
            kHeightSizedBox(20.0.h),
            Center(
              child: kCenteredDescription(
                  'Piešķiriet spirālei krāsas, simbolus,\nvārdus vai afirmācijas, kas tev\nsaistās ar cerību',
                  kActiveYellow,
                  18),
            ),
            Expanded(
              child: IconButton(
                iconSize: 100.0,
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => SecondDrawTaskIntroScreen()));
                },
                icon: SvgPicture.asset(
                    'assets/images/common/forward_button_yellow.svg'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
