import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
