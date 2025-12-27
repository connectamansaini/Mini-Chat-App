import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mini_chat_app/src/src.dart';

void main() {
  group('UsersTab', () {
    testWidgets('shows snackbar with added user name', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: UsersTab(),
          ),
        ),
      );

      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), 'Zelda');
      await tester.tap(find.text('Add'));
      await tester.pumpAndSettle();

      expect(find.text('User added: Zelda'), findsOneWidget);
      expect(find.text('Zelda'), findsWidgets);
    });
  });
}
