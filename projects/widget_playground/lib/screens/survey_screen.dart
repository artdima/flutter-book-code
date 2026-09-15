import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Что получилось из заполненной анкеты.
class Survey {
  const Survey({
    required this.name,
    required this.age,
    required this.topic,
    required this.email,
  });

  final String name;
  final int age;
  final String topic;
  final String email;
}

class SurveyScreen extends StatefulWidget {
  const SurveyScreen({super.key});

  @override
  State<SurveyScreen> createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _emailController = TextEditingController();

  final _ageFocus = FocusNode();
  final _emailFocus = FocusNode();

  String? _topic;
  bool _agreed = false;
  bool _showAgreeError = false;
  Survey? _result;

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    _emailController.dispose();
    _ageFocus.dispose();
    _emailFocus.dispose();
    super.dispose();
  }

  void _submit() {
    FocusScope.of(context).unfocus();

    final formOk = _formKey.currentState!.validate();
    setState(() => _showAgreeError = !_agreed);
    if (!formOk || !_agreed) return;

    setState(() {
      _result = Survey(
        name: _nameController.text.trim(),
        age: int.parse(_ageController.text),
        topic: _topic!,
        email: _emailController.text.trim(),
      );
    });
  }

  void _resetAll() {
    _formKey.currentState!.reset();
    setState(() {
      _topic = null;
      _agreed = false;
      _showAgreeError = false;
      _result = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Анкета участника')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _nameController,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) => _ageFocus.requestFocus(),
                decoration: const InputDecoration(
                  labelText: 'Имя',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  final text = value?.trim() ?? '';
                  if (text.isEmpty) return 'Без имени не обойтись';
                  if (text.length < 2) return 'Слишком коротко';
                  if (text.length > 20) return 'Не больше 20 символов';
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _ageController,
                focusNode: _ageFocus,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) => _emailFocus.requestFocus(),
                decoration: const InputDecoration(
                  labelText: 'Возраст',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  final age = int.tryParse(value ?? '');
                  if (age == null) return 'Это не число';
                  if (age < 5 || age > 120) return 'Возраст от 5 до 120';
                  return null;
                },
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                initialValue: _topic,
                decoration: const InputDecoration(
                  labelText: 'Любимая тема',
                  border: OutlineInputBorder(),
                ),
                items: const [
                  DropdownMenuItem(value: 'Космос', child: Text('Космос')),
                  DropdownMenuItem(value: 'Животные', child: Text('Животные')),
                  DropdownMenuItem(value: 'История', child: Text('История')),
                ],
                onChanged: (value) => setState(() => _topic = value),
                validator: (value) => value == null ? 'Выберите тему' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _emailController,
                focusNode: _emailFocus,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.done,
                decoration: const InputDecoration(
                  labelText: 'Почта для результатов (необязательно)',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  final text = value?.trim() ?? '';
                  if (text.isEmpty) return null;
                  if (!text.contains('@') || !text.contains('.')) {
                    return 'Похоже на ошибку в адресе';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Checkbox(
                    value: _agreed,
                    onChanged: (value) {
                      setState(() {
                        _agreed = value ?? false;
                        if (_agreed) _showAgreeError = false;
                      });
                    },
                  ),
                  const Expanded(
                    child: Text('Согласен участвовать в викторине'),
                  ),
                ],
              ),
              if (_showAgreeError)
                const Text(
                  'Без согласия никак',
                  style: TextStyle(color: Colors.red),
                ),
              const SizedBox(height: 16),
              FilledButton(
                onPressed: _submit,
                child: const Text('Сохранить'),
              ),
              if (_result != null) ...[
                const SizedBox(height: 24),
                _ResultCard(survey: _result!),
                const SizedBox(height: 8),
                TextButton(
                  onPressed: _resetAll,
                  child: const Text('Заполнить заново'),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _ResultCard extends StatelessWidget {
  const _ResultCard({required this.survey});

  final Survey survey;

  @override
  Widget build(BuildContext context) {
    final email = survey.email.isEmpty ? 'не указана' : survey.email;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Анкета принята', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            Text('Имя: ${survey.name}'),
            Text('Возраст: ${survey.age}'),
            Text('Тема: ${survey.topic}'),
            Text('Почта: $email'),
          ],
        ),
      ),
    );
  }
}
