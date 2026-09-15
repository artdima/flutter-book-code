// Глава 9, «Поток событий: Stream (на вырост)».
void main() async {
  await for (var n in countdown(3)) {
    print(n);
  }
  print('Поехали!');
}

Stream<int> countdown(int from) async* {
  for (var i = from; i > 0; i--) {
    await Future.delayed(const Duration(seconds: 1));
    yield i;
  }
}
