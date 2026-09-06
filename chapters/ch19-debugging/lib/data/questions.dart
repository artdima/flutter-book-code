import '../models/question.dart';

const questions = [
  Question(
    text: 'Какая планета ближе всех к Солнцу?',
    answers: ['Венера', 'Меркурий', 'Марс', 'Земля'],
    correctIndex: 1,
  ),
  Question(
    text: 'Сколько ног у паука?',
    answers: ['6', '8', '10', 'Сколько захочет'],
    correctIndex: 1,
  ),
  Question(
    text: 'Что делает команда setState во Flutter?',
    answers: [
      'Удаляет приложение',
      'Меняет цвет кнопки',
      'Просит перестроить экран',
      'Ставит игру на паузу',
    ],
    correctIndex: 2,
  ),
  Question(
    text: 'Какой океан самый большой?',
    answers: ['Атлантический', 'Индийский', 'Тихий', 'Северный Ледовитый'],
    correctIndex: 2,
  ),
  Question(
    text: 'Из чего делают шоколад?',
    answers: [
      'Из какао-бобов',
      'Из кофе',
      'Из фиников',
      'Из коричневой краски',
    ],
    correctIndex: 0,
  ),
];
