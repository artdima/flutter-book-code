// Глава 3, «Логические выражения: правда и неправда».
void main() {
  print(5 > 3);    // true  — пять больше трёх
  print(5 < 3);    // false
  print(5 == 5);   // true  — пять равно пяти
  print(5 != 3);   // true  — пять НЕ равно трём
  print(5 >= 5);   // true  — больше или равно
  print(5 <= 4);   // false — меньше или равно

  var age = 13;
  var password = 'dragon';

  print(age >= 14);            // false
  print(password == 'dragon'); // true

  var hasTicket = age >= 12;
  print(hasTicket);   // true
}
