import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mini_chat_app/src/src.dart';

void main() {
  group('HomeView tab scroll preservation', () {
    testWidgets('Users tab keeps scroll offset when switching tabs', (
      tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: DefaultTabController(
            length: 2,
            child: Scaffold(
              body: HomeView(),
            ),
          ),
        ),
      );

      // Scroll Users list down
      final usersList = find.byType(Scrollable).first;
      await tester.drag(usersList, const Offset(0, -300));
      await tester.pumpAndSettle();

      final usersState = tester.state<ScrollableState>(usersList);
      final offsetAfterScroll = usersState.position.pixels;
      expect(offsetAfterScroll, greaterThan(0));

      // Switch to Chat History tab
      await tester.tap(find.text('Chat History'));
      await tester.pumpAndSettle();

      // Switch back to Users tab
      await tester.tap(find.text('Users'));
      await tester.pumpAndSettle();

      final usersStateAfter = tester.state<ScrollableState>(usersList);
      expect(usersStateAfter.position.pixels, closeTo(offsetAfterScroll, 0.1));
    });
  });
}
