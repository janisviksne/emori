import 'package:floor/floor.dart';

@entity
class DrawTaskReflection {
  @PrimaryKey(autoGenerate: true)
  final int? reflectionAnswerId;

  late String answerTitle1;
  late String answerTitle2;
  late String answerTitle3;
  late String answerTitle4;
  late String answerTitle5;
  late String answerDateTime;

  DrawTaskReflection(
      {this.reflectionAnswerId,
      required this.answerTitle1,
      required this.answerTitle2,
      required this.answerTitle3,
      required this.answerTitle4,
      required this.answerTitle5,
      required this.answerDateTime});
}
