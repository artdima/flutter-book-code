// Глава 8, «Собираем всё: анкета игрока».
class Player {
  String name;
  String? nickname;     // необязательный
  int? bestScore;       // может отсутствовать

  Player(this.name, {this.nickname, this.bestScore});

  String get title => nickname ?? name;

  String describe() {
    var scorePart = bestScore != null
        ? 'рекорд — $bestScore'
        : 'ещё не играл';
    return '$title: $scorePart';
  }
}

void main() {
  var players = [
    Player('Михаил', nickname: 'Misha_2013', bestScore: 140),
    Player('Аня', bestScore: 200),
    Player('Новичок'),
  ];

  for (var p in players) {
    print(p.describe());
  }

  // Лучший рекорд среди всех — пропуская тех, кто не играл
  var best = 0;
  for (var p in players) {
    var score = p.bestScore;
    if (score != null && score > best) {
      best = score;
    }
  }
  print('Лучший результат: $best');
}
