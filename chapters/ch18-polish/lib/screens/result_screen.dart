import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Глава 15: итог игры. Глава 16: рекорд, переживающий закрытие приложения.
/// Глава 18: кнопка «Похвастаться».
class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key, required this.score, required this.total});

  final int score;
  final int total;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  final _prefs = SharedPreferencesAsync();
  int? _bestScore; // null — ещё не загрузили или рекорда нет
  bool _isNewRecord = false;

  @override
  void initState() {
    super.initState();
    _checkRecord();
  }

  void _checkRecord() {
    _prefs.getInt('best_score').then((saved) {
      if (!mounted) return;
      final best = saved ?? 0;
      if (widget.score > best) {
        _prefs.setInt('best_score', widget.score);
        setState(() {
          _bestScore = widget.score;
          _isNewRecord = true;
        });
      } else {
        setState(() => _bestScore = best);
      }
    });
  }

  String get verdict {
    final percent = widget.score / widget.total;
    if (percent == 1.0) return 'Идеально! Ни одной ошибки!';
    if (percent >= 0.7) return 'Отличный результат!';
    if (percent >= 0.4) return 'Неплохо, но есть куда расти.';
    return 'Кажется, нужна перезагрузка. Ещё разок?';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Icon(
                widget.score / widget.total >= 0.7
                    ? Icons.emoji_events
                    : Icons.sentiment_satisfied,
                size: 96,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(height: 16),
              Text(
                '${widget.score} из ${widget.total}',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayMedium,
              ),
              Text(verdict, textAlign: TextAlign.center),
              if (_isNewRecord)
                Text(
                  '🏆 Новый рекорд!',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge,
                )
              else if (_bestScore != null)
                Text('Рекорд: $_bestScore', textAlign: TextAlign.center),
              const SizedBox(height: 32),
              FilledButton.icon(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/game');
                },
                icon: const Icon(Icons.replay),
                label: const Text('Сыграть ещё'),
              ),
              const SizedBox(height: 8),
              OutlinedButton.icon(
                onPressed: () {
                  SharePlus.instance.share(
                    ShareParams(
                      text: 'Я набрал ${widget.score} из ${widget.total} '
                          'в «Викторине»! Слабо больше? 🧠',
                    ),
                  );
                },
                icon: const Icon(Icons.share),
                label: const Text('Похвастаться'),
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('На главную'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
