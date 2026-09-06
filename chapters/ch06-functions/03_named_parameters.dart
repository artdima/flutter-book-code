// Глава 6, «Именованные параметры».
void makeCake({required String flavor, required int layers, bool candles = true}) {
  var withCandles = candles ? 'со свечками' : 'без свечек';
  print('Готовим $flavor-торт: $layers коржа, $withCandles.');
}

void main() {
  makeCake(flavor: 'шоколад', layers: 3);
  makeCake(layers: 1, flavor: 'морковь', candles: false);
}
