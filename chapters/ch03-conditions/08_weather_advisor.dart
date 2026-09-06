// Глава 3, «Мини-проект: советчик по погоде».
// Сначала предскажите ответ, потом запускайте: 8° с дождём, −5° без дождя, +25° с дождём.
void main() {
  var temperature = 8;     // градусы
  var isRaining = true;

  print('За окном $temperature°, дождь: ${isRaining ? 'идёт' : 'не идёт'}.');

  if (temperature >= 20) {
    print('Футболка и хорошее настроение!');
  } else if (temperature >= 10) {
    print('Накинь ветровку.');
  } else if (temperature >= 0) {
    print('Куртка обязательна.');
  } else {
    print('Шапка, шарф и всё самое тёплое!');
  }

  if (isRaining && temperature > 0) {
    print('И возьми зонт.');
  } else if (isRaining) {
    print('Такой дождь уже называется снегом.');
  }
}
