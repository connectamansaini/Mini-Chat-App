import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_chat_app/src/src.dart';

class UsersTab extends StatelessWidget {
  const UsersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          final users = state.users;
          return ListView.separated(
            key: const PageStorageKey<String>('usersTabScroll'),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            itemBuilder: (context, index) {
              final user = users[index];
              return UserTile(user: user);
            },
            separatorBuilder: (_, _) => const SizedBox(height: 8),
            itemCount: users.length,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final nameController = TextEditingController();

          await showDialog<void>(
            context: context,
            builder: (dialogContext) => AlertDialog(
              title: const Text('Add user'),
              content: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  hintText: 'Enter user name',
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(dialogContext).pop(),
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    final name = nameController.text.trim();
                    if (name.isEmpty) return;

                    context.read<UserBloc>().add(CreateUser(name));
                    Navigator.of(dialogContext).pop();
                  },
                  child: const Text('Add'),
                ),
              ],
            ),
          );
        },
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xFF165DFC),
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
