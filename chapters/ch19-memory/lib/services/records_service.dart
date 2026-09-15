import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

/// Глава 16: одна строка таблицы рекордов.
class RecordEntry {
  const RecordEntry({required this.name, required this.score});

  factory RecordEntry.fromJson(Map<String, dynamic> json) =>
      RecordEntry(name: json['name'] as String, score: json['score'] as int);

  final String name;
  final int score;

  Map<String, dynamic> toJson() => {'name': name, 'score': score};
}

/// Глава 16: служба хранения рекордов — экраны не знают про ключи и JSON.
class RecordsService {
  final _prefs = SharedPreferencesAsync();

  Future<List<RecordEntry>> load() async {
    final text = await _prefs.getString('records');
    if (text == null) return <RecordEntry>[];

    final list = jsonDecode(text) as List;
    return list
        .map((item) => RecordEntry.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  Future<void> add(RecordEntry entry) async {
    final records = await load();
    records.add(entry);
    records.sort((a, b) => b.score.compareTo(a.score)); // лучшие сверху
    if (records.length > 10) records.removeRange(10, records.length);

    final text = jsonEncode(records.map((r) => r.toJson()).toList());
    await _prefs.setString('records', text);
  }
}
