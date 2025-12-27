import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_chat_app/app/injector.dart';
import 'package:mini_chat_app/src/src.dart';

class UserTile extends StatelessWidget {
  const UserTile({required this.user, super.key});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => _openChat(context, user),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Row(
            spacing: 12,
            children: [
              UserAvatar(user: user),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: Color(0xFF1A1B2F),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      user.subtitle,
                      style: const TextStyle(
                        color: Color(0xFF6B6E7C),
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _openChat(BuildContext context, UserModel user) async {
    await Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => BlocProvider(
          create: (context) => getIt<ChatBloc>(),
          // ..add(ChatHistoryRequested())
          child: ChatDetailPage(user: user, messages: messages),
        ),
      ),
    );
  }
}
