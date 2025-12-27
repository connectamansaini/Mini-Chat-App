import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_chat_app/app/injector.dart';
import 'package:mini_chat_app/src/src.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              // snap: true,
              backgroundColor: Colors.white,
              elevation: innerBoxIsScrolled ? 0.5 : 0,
              surfaceTintColor: Colors.white,
              automaticallyImplyLeading: false,
              floating: true,
              toolbarHeight: 0,
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(80),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 8),
                    const TabBarWidget(),
                    Divider(
                      color: Colors.grey.shade300,
                      height: 24,
                    ),
                  ],
                ),
              ),
            ),
          ];
        },
        body: TabBarView(
          children: [
            BlocProvider(
              create: (context) => UserBloc(),
              child: const UsersTab(),
            ),
            const HistoryTab(items: historyItems),
          ],
        ),
      ),
    );
  }
}

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Colors.grey.shade300,
      ),
      child: TabBar(
        indicatorPadding: const EdgeInsets.all(4),
        splashBorderRadius: BorderRadius.circular(24),
        indicatorSize: TabBarIndicatorSize.tab,
        labelStyle: theme.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w700,
        ),
        dividerColor: Colors.transparent,
        indicator: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
        ),
        tabs: const [
          Tab(text: 'Users'),
          Tab(text: 'Chat History'),
        ],
      ),
    );
  }
}

class HistoryTab extends StatelessWidget {
  const HistoryTab({required this.items, super.key});

  final List<ChatHistoryItem> items;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
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
          create: (context) => getIt<ChatBloc>()..add(ChatHistoryRequested()),
          child: ChatDetailPage(user: user, messages: messages),
        ),
      ),
    );
  }
}
