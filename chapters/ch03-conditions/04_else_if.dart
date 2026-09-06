// Глава 3, «Цепочка else if: больше двух вариантов».
void main() {
  var score = 78;

  if (score >= 90) {
    print('Блестяще!');
  } else if (score >= 60) {
    print('Хорошо, но можно лучше.');
  } else {
    print('Стоит потренироваться ещё.');
  }
}
