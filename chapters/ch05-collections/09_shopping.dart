// Глава 5, «Мини-проект: покупки ко дню рождения».
void main() {
  var prices = {
    'торт': 1200,
    'шарики': 300,
    'сок': 250,
    'пицца': 850,
    'свечки': 90,
  };

  // Итог
  var total = 0;
  for (var price in prices.values) {
    total += price;
  }
  print('Всего покупок: ${prices.length} на сумму $total рублей.');

  // Самая дорогая покупка
  var maxName = '';
  var maxPrice = 0;
  for (var entry in prices.entries) {
    if (entry.value > maxPrice) {
      maxPrice = entry.value;
      maxName = entry.key;
    }
  }
  print('Дороже всего — $maxName: $maxPrice рублей.');

  // Что влезает в бюджет 2000, если начать с дешёвого
  var budget = 2000;
  var sortedPrices = prices.entries.toList();
  sortedPrices.sort((a, b) => a.value.compareTo(b.value));

  var bought = <String>[];
  var spent = 0;
  for (var entry in sortedPrices) {
    if (spent + entry.value <= budget) {
      bought.add(entry.key);
      spent += entry.value;
    }
  }
  print('На $budget рублей берём: ${bought.join(', ')} (итого $spent).');
}
