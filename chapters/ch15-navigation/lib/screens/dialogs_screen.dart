import 'package:flutter/material.dart';

/// Глава 13: диалог, SnackBar и всплывающая шторка.
class DialogsScreen extends StatefulWidget {
  const DialogsScreen({super.key});

  @override
  State<DialogsScreen> createState() => _DialogsScreenState();
}

class _DialogsScreenState extends State<DialogsScreen> {
  String _lastAction = 'Пока ничего не происходило';

  void _confirmDelete() {
    showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Удалить запись?'),
        content: const Text('Отменить это будет нельзя.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Отмена'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Удалить'),
          ),
        ],
      ),
    ).then((confirmed) {
      if (!mounted) return;
      setState(() {
        _lastAction = confirmed == true
            ? 'Запись удалена по-настоящему'
            : 'Удаление отменено';
      });
    });
  }

  void _showSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Сохранено!')),
    );
  }

  void _showSheet() {
    showModalBottomSheet<void>(
      context: context,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.share),
              title: const Text('Поделиться'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.copy),
              title: const Text('Скопировать ссылку'),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Диалоги и SnackBar')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            FilledButton(
              onPressed: _confirmDelete,
              child: const Text('Диалог с подтверждением'),
            ),
            const SizedBox(height: 8),
            OutlinedButton(
              onPressed: _showSnackBar,
              child: const Text('Показать SnackBar'),
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: _showSheet,
              child: const Text('Открыть шторку'),
            ),
            const SizedBox(height: 24),
            Text(_lastAction, style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
