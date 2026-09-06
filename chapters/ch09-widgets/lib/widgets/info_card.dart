import 'package:flutter/material.dart';

/// Свой виджет из главы 9: карточка с текстом и цветом.
class InfoCard extends StatelessWidget {
  const InfoCard({super.key, required this.text, required this.color});

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      height: 120,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Center(
        child: Text(text, style: const TextStyle(fontSize: 24)),
      ),
    );
  }
}
