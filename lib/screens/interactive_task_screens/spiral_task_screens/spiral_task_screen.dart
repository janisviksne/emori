import 'dart:async';
import 'dart:developer';
import 'dart:typed_data';

import 'package:emori/screens/interactive_task_screens/spiral_task_screens/spiral_task_description.dart';
import 'package:emori/screens/interactive_task_screens/spiral_task_screens/spiral_task_done.dart';
import 'package:emori/utilities/constants/text_constants/text_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:scribble/scribble.dart';

class SpiralTaskScreen extends StatefulWidget {
  const SpiralTaskScreen({Key? key}) : super(key: key);

  @override
  State<SpiralTaskScreen> createState() => _SpiralTaskScreenState();
}

class _SpiralTaskScreenState extends State<SpiralTaskScreen> {
  late ScribbleNotifier notifier;
  late FocusNode focusNode;
  @override
  void initState() {
    notifier = ScribbleNotifier();
    focusNode = FocusNode();
    super.initState();
  }

  String formatSeconds() {
    return DateTime.now().second < 10
        ? '0' + DateTime.now().second.toString()
        : DateTime.now().second.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            kHeightSizedBox(20.0),
            Stack(
              children: [
                IconButton(
                  iconSize: 50.0,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: SvgPicture.asset(
                      'assets/images/common/back_arrow_green.svg'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, right: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {
                            setState(() {
                              _saveImage(context);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          SpiralTaskDoneScreen()));
                            });
                          },
                          icon: SvgPicture.asset(
                              'assets/images/interactive_task_backgrounds/draw_task/submit_icon.svg')),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          SpiralTaskDescriptionScreen()));
                            });
                          },
                          icon: SvgPicture.asset(
                              'assets/images/interactive_task_backgrounds/draw_task/green_info_icon.svg'))
                    ],
                  ),
                )
              ],
            ),
            Stack(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.width * 2,
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 125.0.h),
                        child: Image.asset(
                            'assets/images/interactive_task_backgrounds/spiral_task/spiral.png'),
                      ),
                      Scribble(
                        minWidthFactor: 0.5,
                        notifier: notifier,
                        drawPen: true,
                      ),
                      Positioned(
                        right: 1,
                        child: Column(
                          children: [
                            _buildColorToolbar(context),
                            _buildStrokeToolbar(context),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  //ToDo find out possible image save (without using screenshot)

  Future<void> _saveImage(BuildContext context) async {
    final image = await notifier.renderImage();
    if (!(await Permission.storage.status.isGranted))
      await Permission.storage.request();

    final result = await ImageGallerySaver.saveImage(
        Uint8List.fromList(image.buffer.asUint8List()),
        quality: 60,
        name: DateTime.now().day.toString() +
            '-' +
            DateTime.now().month.toString() +
            '-' +
            DateTime.now().year.toString() +
            ' ' +
            DateTime.now().hour.toString() +
            ':' +
            DateTime.now().minute.toString() +
            ':' +
            formatSeconds());
    log(result);

    // showDialog(
    //   context: context,
    //   builder: (context) => AlertDialog(
    //     title: Text(DateTime.now().day.toString() +
    //         '-' +
    //         DateTime.now().month.toString() +
    //         '-' +
    //         DateTime.now().year.toString() +
    //         ' ' +
    //         DateTime.now().hour.toString() +
    //         ':' +
    //         DateTime.now().minute.toString() +
    //         ':' +
    //         formatSeconds()),
    //     content: Stack(
    //       //ToDo check if i can make drawing size bigger
    //       children: [
    //         Padding(
    //           padding: EdgeInsets.only(left: 40.0.w, bottom: 40.0.h),
    //           child: Image.memory(
    //             image.buffer.asUint8List(),
    //             fit: BoxFit.fill,
    //           ),
    //         ),
    //         Image.asset(
    //             'assets/images/interactive_task_backgrounds/spiral_task/spiral.png')
    //       ],
    //     ),
    //   ),
    // );
  }

  Widget _buildStrokeToolbar(BuildContext context) {
    return StateNotifierBuilder<ScribbleState>(
      stateNotifier: notifier,
      builder: (context, state, _) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          for (final w in notifier.widths)
            _buildStrokeButton(
              context,
              strokeWidth: w,
              state: state,
            ),
        ],
      ),
    );
  }

  Widget _buildStrokeButton(
    BuildContext context, {
    required double strokeWidth,
    required ScribbleState state,
  }) {
    final selected = state.selectedWidth == strokeWidth;
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Material(
        elevation: selected ? 4 : 0,
        shape: const CircleBorder(),
        child: InkWell(
          onTap: () => notifier.setStrokeWidth(strokeWidth),
          customBorder: const CircleBorder(),
          child: AnimatedContainer(
            duration: kThemeAnimationDuration,
            width: strokeWidth * 2,
            height: strokeWidth * 2,
            decoration: BoxDecoration(
                color: state.map(
                  drawing: (s) => Color(s.selectedColor),
                  erasing: (_) => Colors.transparent,
                ),
                border: state.map(
                  drawing: (_) => null,
                  erasing: (_) => Border.all(width: 1),
                ),
                borderRadius: BorderRadius.circular(50.0)),
          ),
        ),
      ),
    );
  }

  Widget _buildColorToolbar(BuildContext context) {
    return StateNotifierBuilder<ScribbleState>(
      stateNotifier: notifier,
      builder: (context, state, _) => Column(
        children: [
          _buildUndoButton(context),
          const Divider(
            height: 4.0,
          ),
          _buildRedoButton(context),
          const Divider(
            height: 4.0,
          ),
          _buildClearButton(context),
          const Divider(
            height: 10.0,
          ),
          _buildEraserButton(context, isSelected: state is Erasing),
          _buildColorButton(context,
              color: Colors.black, state: state, heroTag: 'black'),
          _buildColorButton(context,
              color: Colors.red, state: state, heroTag: 'red'),
          _buildColorButton(context,
              color: Colors.green, state: state, heroTag: 'green'),
          _buildColorButton(context,
              color: Colors.blue, state: state, heroTag: 'blue'),
          _buildColorButton(context,
              color: Colors.yellow, state: state, heroTag: 'yellow'),
          const Divider(
            height: 20.0,
          ),
        ],
      ),
    );
  }

  Widget _buildEraserButton(BuildContext context, {required bool isSelected}) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: FloatingActionButton.small(
        heroTag: 'Erase',
        tooltip: "Erase",
        backgroundColor: const Color(0xFFF7FBFF),
        elevation: isSelected ? 10 : 2,
        shape: !isSelected
            ? const CircleBorder()
            : RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
        child: const Icon(Icons.remove, color: Colors.blueGrey),
        onPressed: notifier.setEraser,
      ),
    );
  }

  Widget _buildColorButton(BuildContext context,
      {required Color color,
      required ScribbleState state,
      required String heroTag}) {
    final isSelected = state is Drawing && state.selectedColor == color.value;
    return Padding(
      padding: const EdgeInsets.all(4),
      child: FloatingActionButton.small(
          heroTag: heroTag,
          backgroundColor: color,
          elevation: isSelected ? 10 : 2,
          shape: !isSelected
              ? const CircleBorder()
              : RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
          child: Container(),
          onPressed: () => notifier.setColor(color)),
    );
  }

  Widget _buildUndoButton(
    BuildContext context,
  ) {
    return FloatingActionButton.small(
      tooltip: "Undo",
      heroTag: 'undo',
      onPressed: notifier.canUndo ? notifier.undo : null,
      disabledElevation: 0,
      backgroundColor: notifier.canUndo ? Colors.blueGrey : Colors.grey,
      child: const Icon(
        Icons.undo_rounded,
        color: Colors.white,
      ),
    );
  }

  Widget _buildRedoButton(
    BuildContext context,
  ) {
    return FloatingActionButton.small(
      heroTag: 'redo',
      tooltip: "Redo",
      onPressed: notifier.canRedo ? notifier.redo : null,
      disabledElevation: 0,
      backgroundColor: notifier.canRedo ? Colors.blueGrey : Colors.grey,
      child: const Icon(
        Icons.redo_rounded,
        color: Colors.white,
      ),
    );
  }

  Widget _buildClearButton(BuildContext context) {
    return FloatingActionButton.small(
      heroTag: 'clear',
      tooltip: "Clear",
      onPressed: notifier.clear,
      disabledElevation: 0,
      backgroundColor: Colors.blueGrey,
      child: SvgPicture.asset(
          'assets/images/interactive_task_backgrounds/draw_task/clear_all.svg'),
    );
  }
}
