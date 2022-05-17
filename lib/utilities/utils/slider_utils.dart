class AnswerA {
  int answerId;
  String answerTitle;

  AnswerA(this.answerId, this.answerTitle);
}

class SliderUtils {
  static AnswerA labelValue(double value) {
    if (value == 0 && value < 4.0) {
      return AnswerA(5, 'Nekad');
    } else if (value >= 4.0 && value < 8.0) {
      return AnswerA(4, 'Reti');
    } else if (value >= 8.0 && value < 12.0) {
      return AnswerA(3, 'Dažreiz');
    } else if (value >= 12.0 && value < 16.0) {
      return AnswerA(2, 'Bieži');
    } else {
      return AnswerA(1, 'Gandrīz vienmēr');
    }
  }
}
