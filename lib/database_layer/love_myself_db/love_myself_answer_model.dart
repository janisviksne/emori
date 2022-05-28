import 'package:floor/floor.dart';

@entity
class LoveMyselfAnswer {
  @PrimaryKey(autoGenerate: true)
  final int? answerId;

  late String answerTitle1;
  late String answerTitle2;
  late String answerTitle3;
  late String answerTitle4;
  late String answerTitle5;
  late String answerTitle6;
  late String answerTitle7;
  late String answerTitle8;

  late String answerDateTime;

  LoveMyselfAnswer(
      {this.answerId,
      required this.answerTitle1,
      required this.answerTitle2,
      required this.answerTitle3,
      required this.answerTitle4,
      required this.answerTitle5,
      required this.answerTitle6,
      required this.answerTitle7,
      required this.answerTitle8,
      required this.answerDateTime});
}
