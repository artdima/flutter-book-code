// Глава 3, «Составные условия: и, или, не».
void main() {
  var age = 13;
  var withParent = true;

  if (age >= 16 || withParent) {
    print('Проходите!');
  } else {
    print('Только со взрослыми.');
  }

  var hasKey = true;
  var knowsPassword = false;

  if (hasKey && knowsPassword) {
    print('Сундук открыт!');
  } else {
    print('Нужны и ключ, и пароль.');
  }

  var isGameOver = false;

  if (!isGameOver) {
    print('Играем дальше!');
  }

  var isWeekend = true;
  var isHoliday = false;
  var isSick = false;

  if ((isWeekend || isHoliday) && !isSick) {
    print('Идём гулять!');
  }
}
