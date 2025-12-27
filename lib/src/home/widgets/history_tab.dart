import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_chat_app/app/injector.dart';
import 'package:mini_chat_app/src/src.dart';

class HistoryTab extends StatelessWidget {
  const HistoryTab({required this.items, super.key});

  final List<ChatHistoryItem> items;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      key: const PageStorageKey<String>('historyTabScroll'),
      primary: false,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      itemBuilder: (context, index) {
        final item = items[index];
        return HistoryTile(item: item);
      },
      separatorBuilder: (_, _) => const SizedBox(height: 2),
      itemCount: items.length,
    );
  }
}

class HistoryTile extends StatelessWidget {
  const HistoryTile({required this.item, super.key});

  final ChatHistoryItem item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () => _openChat(context, item.user),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        child: Row(
          children: [
            UserAvatar(user: item.user),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          item.user.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                            color: Color(0xFF1A1B2F),
                          ),
                        ),
                      ),
                      Text(
                        item.timeLabel,
                        style: const TextStyle(
                          color: Color(0xFF8C91A0),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          item.preview,
                          style: const TextStyle(
                            color: Color(0xFF6B6E7C),
                            fontSize: 13,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (item.user.unreadCount > 0) ...[
                        const SizedBox(width: 8),
                        UnreadBadge(count: item.user.unreadCount),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _openChat(BuildContext context, UserModel user) async {
    await Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => BlocProvider(
          create: (context) => getIt<ChatBloc>()
          // ..add(ChatHistoryRequested())
          ,
          child: ChatDetailPage(user: user, messages: messages),
        ),
      ),
    );
  }
}
