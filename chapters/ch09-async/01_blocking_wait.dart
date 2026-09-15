// Глава 9, «Что будет, если ждать в лоб».
void main() {
  print('Начали');

  var stopAt = DateTime.now().add(const Duration(seconds: 3));
  while (DateTime.now().isBefore(stopAt)) {
    // крутимся вхолостую, пока не пройдут три секунды
  }

  print('Прошло три секунды');
}
