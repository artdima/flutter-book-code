// Глава 5, «Множество: только уникальное».
void main() {
  var visited = <String>{};

  visited.add('лес');
  visited.add('пещера');
  visited.add('лес');      // уже есть — молча не добавится

  print(visited);          // {лес, пещера}
  print(visited.contains('пещера'));   // true
}
