// Глава 6, «Короткая запись: стрелка =>».
int double_(int x) => x * 2;
String shout(String text) => '${text.toUpperCase()}!!!';
bool isEven(int n) => n % 2 == 0;

void main() {
  print(double_(21));
  print(shout('ура'));
  print(isEven(4));
  print(isEven(7));
}
