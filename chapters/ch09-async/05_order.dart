// Глава 9, «Кто за кем: главный фокус главы».
void main() async {
  print('1 — начали');
  var sum = await slowSum(2, 3);
  print('4 — результат: $sum');
  print('5 — закончили');
}

Future<int> slowSum(int a, int b) async {
  print('2 — считаю…');
  await Future.delayed(const Duration(seconds: 1));
  print('3 — посчитал');
  return a + b;
}
