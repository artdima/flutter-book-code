// Проверка, что песочница запускается и показывает список опытов.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:widget_playground/main.dart';

void main() {
  testWidgets('Хаб песочницы показывает список опытов', (tester) async {
    await tester.pumpWidget(const PlaygroundApp());

    expect(find.text('Моя песочница'), findsOneWidget);
    expect(find.text('Магический шар'), findsOneWidget);
  });
}
