import 'package:floor/floor.dart';

@entity
class LoveMyselfAnswer {
  @primaryKey
  late int answerId;

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
      this.answerId,
      this.answerTitle1,
      this.answerTitle2,
      this.answerTitle3,
      this.answerTitle4,
      this.answerTitle5,
      this.answerTitle6,
      this.answerTitle7,
      this.answerTitle8,
      this.answerDateTime);
}
