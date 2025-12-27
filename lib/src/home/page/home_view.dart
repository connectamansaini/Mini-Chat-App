import 'package:flutter/material.dart';
import 'package:mini_chat_app/src/src.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  bool _showHeader = true;
  static const _toggleThreshold = 18.0;

  bool _handleScrollNotification(ScrollNotification notification) {
    if (notification.metrics.axis != Axis.vertical) {
      return false;
    }

    if (notification is ScrollUpdateNotification) {
      final delta = notification.scrollDelta ?? 0;

      if (delta > _toggleThreshold && _showHeader) {
        setState(() => _showHeader = false);
      } else if (delta < -_toggleThreshold && !_showHeader) {
        setState(() => _showHeader = true);
      }
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            ClipRect(
              child: AnimatedSize(
                duration: const Duration(milliseconds: 220),
                curve: Curves.easeOut,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 180),
                  curve: Curves.easeOut,
                  opacity: _showHeader ? 1 : 0,
                  child: _showHeader
                      ? Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(height: 8),
                            const TabBarWidget(),
                            Divider(
                              color: Colors.grey.shade300,
                              height: 24,
                            ),
                          ],
                        )
                      : const SizedBox.shrink(),
                ),
              ),
            ),
            Expanded(
              child: NotificationListener<ScrollNotification>(
                onNotification: _handleScrollNotification,
                child: const TabBarView(
                  children: [
                    UsersTab(),
                    HistoryTab(items: historyItems),
                  ],
                ),
              ),
            ),
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
