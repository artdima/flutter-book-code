import 'package:flutter/material.dart';

/// Глава 15: кнопка варианта ответа с подсветкой.
class AnswerButton extends StatelessWidget {
  const AnswerButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color,
  });

  final String text;
  final VoidCallback? onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonal(
      style: color == null
          ? null
          : FilledButton.styleFrom(
              backgroundColor: color,
              foregroundColor: Colors.white,
            ),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Text(text, textAlign: TextAlign.center),
      ),
    );
  }
}
