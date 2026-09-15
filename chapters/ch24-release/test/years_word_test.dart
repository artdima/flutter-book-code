import 'package:flutter_test/flutter_test.dart';
import 'package:quiz_app/utils/years_word.dart';

void main() {
  test('единицы дают «год»', () {
    expect(yearsWord(1), 'год');
    expect(yearsWord(21), 'год');
    expect(yearsWord(101), 'год');
  });

  test('11–14 всегда дают «лет»', () {
    expect(yearsWord(11), 'лет');
    expect(yearsWord(13), 'лет');
    expect(yearsWord(111), 'лет');
  });

  test('2–4 дают «года»', () {
    expect(yearsWord(2), 'года');
    expect(yearsWord(23), 'года');
  });
}
