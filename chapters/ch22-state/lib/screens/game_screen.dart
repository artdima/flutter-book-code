import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import '../data/questions.dart';
import '../models/question.dart';
import '../widgets/answer_button.dart';
import '../widgets/settings_scope.dart';
import 'result_screen.dart';

/// Глава 15: логика игры. Глава 18: плавная смена вопроса и звуки.
class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  int _currentIndex = 0;
  int _score = 0;
  int? _selected; // null — игрок ещё не ответил
  bool _timeIsUp = false;

  Timer? _timer;
  int _secondsLeft = 15;

  final _player = AudioPlayer();

  Question get _question => questions[_currentIndex];
  bool get _answered => _selected != null || _timeIsUp;
  bool get _isLast => _currentIndex + 1 == questions.length;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _player.dispose();
    super.dispose();
  }

  void _startTimer() {
    _timer?.cancel();
    setState(() => _secondsLeft = 15);
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() => _secondsLeft--);
      if (_secondsLeft == 0) {
        timer.cancel();
        setState(() => _timeIsUp = true);
      }
    });
  }

  void _playSound(bool correct) {
    if (!SettingsScope.read(context).soundOn) return;
    _player.play(AssetSource('sounds/${correct ? 'correct' : 'wrong'}.mp3'));
  }

  void _onAnswer(int index) {
    _timer?.cancel();
    _playSound(_question.isCorrect(index));
    setState(() {
      _selected = index;
      if (_question.isCorrect(index)) {
        _score++;
      }
    });
  }

  Color? _buttonColor(int index) {
    if (!_answered) return null; // игра идёт — все обычные
    if (index == _question.correctIndex) return Colors.green;
    if (index == _selected) return Colors.red; // выбранный, но неверный
    return null; // остальные — как были
  }

  void _next() {
    if (_isLast) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              ResultScreen(score: _score, total: questions.length),
        ),
      );
      return;
    }
    setState(() {
      _currentIndex++;
      _selected = null;
      _timeIsUp = false;
    });
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Вопрос ${_currentIndex + 1} из ${questions.length}'),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Text('Счёт: $_score'),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            LinearProgressIndicator(value: _secondsLeft / 15),
            const SizedBox(height: 24),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: Text(
                _question.text,
                key: ValueKey(_currentIndex),
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            const SizedBox(height: 24),
            for (var i = 0; i < _question.answers.length; i++)
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: AnswerButton(
                  text: _question.answers[i],
                  color: _buttonColor(i),
                  onPressed: _answered ? null : () => _onAnswer(i),
                ),
              ),
            const Spacer(),
            if (_answered)
              FilledButton(
                onPressed: _next,
                child: Text(_isLast ? 'К результатам' : 'Дальше'),
              ),
          ],
        ),
      ),
    );
  }
}
