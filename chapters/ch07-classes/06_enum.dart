// Глава 7, «Перечисления enum».
enum Difficulty { easy, normal, hard }

void main() {
  var level = Difficulty.normal;

  switch (level) {
    case Difficulty.easy:
      print('10 простых вопросов');
    case Difficulty.normal:
      print('10 вопросов посложнее');
    case Difficulty.hard:
      print('20 вопросов и таймер!');
  }
}
