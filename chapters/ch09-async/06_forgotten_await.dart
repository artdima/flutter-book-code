// Глава 9, «Кто за кем» — что будет, если await забыть.
void main() {
  print('Ставлю чайник');
  boilWater();
  print('Иду за чашкой');
}

Future<void> boilWater() async {
  await Future.delayed(const Duration(seconds: 2));
  print('Чайник вскипел');
}
