// Глава 4, «Вложенные циклы: рисуем ёлочку».
void main() {
  for (var row = 1; row <= 5; row++) {
    var line = '';
    for (var star = 1; star <= row; star++) {
      line += '*';
    }
    print(line);
  }
}
