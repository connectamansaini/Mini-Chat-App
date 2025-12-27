import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mini_chat_app/src/src.dart';
import 'package:mocktail/mocktail.dart';

class _MockChatBloc extends MockBloc<ChatEvent, ChatState>
    implements ChatBloc {}

class _FakeChatState extends Fake implements ChatState {}

void main() {
  setUpAll(() {
    registerFallbackValue(const ChatMessageSendRequested(''));
    registerFallbackValue(_FakeChatState());
  });

  ChatState buildState({List<ChatMessage> sent = const []}) => ChatState(
    chatHistoryStatus: const AppStatus.success(),
    commentsResponse: const CommentsResponse(
      comments: [
        Comment(
          id: 1,
          body: 'Hello from API',
          postId: 1,
          user: CommentUser(id: 2, username: 'api', fullName: 'Api User'),
        ),
      ],
    ),
    sentMessages: sent,
  );

  const seedMessages = [
    ChatMessage(text: 'Seed message', timeLabel: '10:00', isMine: true),
  ];

  group('ChatDetailPage', () {
    testWidgets('renders seed + history messages', (tester) async {
      final bloc = _MockChatBloc();
      when(() => bloc.state).thenReturn(buildState());
      whenListen(bloc, const Stream<ChatState>.empty());

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider.value(
            value: bloc,
            child: const ChatDetailPage(
              user: UserModel(
                name: 'User',
                subtitle: 'Now',
                initials: 'U',
                isOnline: true,
              ),
              messages: seedMessages,
            ),
          ),
        ),
      );

      expect(find.text('Seed message'), findsOneWidget);
      expect(find.text('Hello from API'), findsOneWidget);
    });

    testWidgets('dispatches ChatMessageSendRequested on send', (tester) async {
      final bloc = _MockChatBloc();
      when(() => bloc.state).thenReturn(buildState());
      whenListen(bloc, const Stream<ChatState>.empty());

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider.value(
            value: bloc,
            child: const ChatDetailPage(
              user: UserModel(
                name: 'User',
                subtitle: 'Now',
                initials: 'U',
                isOnline: true,
              ),
              messages: seedMessages,
            ),
          ),
        ),
      );

      await tester.enterText(find.byType(TextField), 'Hi!');
      await tester.tap(find.byIcon(Icons.send));
      await tester.pump();

      verify(() => bloc.add(const ChatMessageSendRequested('Hi!'))).called(1);
    });
  });
}
