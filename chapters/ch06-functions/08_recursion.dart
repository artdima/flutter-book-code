// Глава 6, «Функция внутри функции и рекурсия».
void countdown(int n) {
  if (n == 0) {
    print('Пуск! 🚀');
    return;
  }
  print(n);
  countdown(n - 1);
}

void main() {
  countdown(5);
}
