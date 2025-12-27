import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mini_chat_app/src/src.dart';

void main() {
  group('HomeView', () {
    testWidgets('shows tab bar with Users and Chat History tabs', (
      tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: DefaultTabController(
            length: 2,
            child: HomeView(),
          ),
        ),
      );

      expect(find.text('Users'), findsOneWidget);
      expect(find.text('Chat History'), findsOneWidget);
      // Ensure both tab views exist
      expect(find.byType(UsersTab), findsOneWidget);
      expect(find.byType(HistoryTab), findsOneWidget);
    });
  });
}
