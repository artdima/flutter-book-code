import 'package:flutter/material.dart';

/// Шкала характеристики из главы 10: подпись и полоса из двух Expanded.
class StatBar extends StatelessWidget {
  const StatBar({
    super.key,
    required this.label,
    required this.value,
    required this.color,
  });

  final String label;
  final double value; // от 0.0 до 1.0
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          SizedBox(width: 90, child: Text(label)),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: (value * 100).round(),
                  child: Container(height: 12, color: color),
                ),
                Expanded(
                  flex: 100 - (value * 100).round(),
                  child: Container(height: 12, color: Colors.grey.shade300),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
