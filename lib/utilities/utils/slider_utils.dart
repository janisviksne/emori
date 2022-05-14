class Answer {
  int answerId;
  String answerTitle;

  Answer(this.answerId, this.answerTitle);
}

class SliderUtils {
  static Answer labelValue(double value) {
    if (value == 0 && value < 4.0) {
      return Answer(5, 'Nekad');
    } else if (value >= 4.0 && value < 8.0) {
      return Answer(4, 'Reti');
    } else if (value >= 8.0 && value < 12.0) {
      return Answer(3, 'Dažreiz');
    } else if (value >= 12.0 && value < 16.0) {
      return Answer(2, 'Bieži');
    } else {
      return Answer(1, 'Gandrīz vienmēr');
    }
  }
}
