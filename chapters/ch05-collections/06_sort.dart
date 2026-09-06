// Глава 5, «Сортировка».
void main() {
  var scores = [98, 85, 77, 100];
  scores.sort();
  print(scores);   // [77, 85, 98, 100]

  scores.sort((a, b) => b.compareTo(a));
  print(scores);   // [100, 98, 85, 77]
}
