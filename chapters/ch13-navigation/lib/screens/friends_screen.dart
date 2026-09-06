import 'package:flutter/material.dart';

import 'friend_screen.dart';

/// Глава 13: самая частая пара всех приложений — список и экран детали.
class FriendsScreen extends StatelessWidget {
  const FriendsScreen({super.key});

  static const _friends = [
    ('Аня', 'футбол'),
    ('Тимур', 'шахматы'),
    ('Соня', 'аниме'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Друзья')),
      body: ListView.builder(
        itemCount: _friends.length,
        itemBuilder: (context, index) {
          final (name, hobby) = _friends[index];
          return ListTile(
            title: Text(name),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FriendScreen(name: name, hobby: hobby),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
