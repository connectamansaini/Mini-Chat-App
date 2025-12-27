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

  ChatState buildState({
    List<ChatMessage> sent = const [],
    AppStatus chatHistoryStatus = const AppStatus.success(),
    WordDictionary wordDictionary = WordDictionary.empty,
    AppStatus wordStatus = const AppStatus.initial(),
    String lookup = '',
  }) => ChatState(
    chatHistoryStatus: chatHistoryStatus,
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
    wordDefinition: wordDictionary,
    wordDefinitionStatus: wordStatus,
    lookupWord: lookup,
    sentMessages: sent,
  );

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
            ),
          ),
        ),
      );

      await tester.enterText(find.byType(TextField), 'Hi!');
      await tester.tap(find.byIcon(Icons.send));
      await tester.pump();

      verify(() => bloc.add(const ChatMessageSendRequested('Hi!'))).called(1);
    });

    testWidgets('scrolls to bottom when new messages arrive', (tester) async {
      final bloc = _MockChatBloc();

      final state1 = buildState();
      final state2 = buildState(
        sent: const [
          ChatMessage(text: 'User msg', timeLabel: '', isMine: true),
          ChatMessage(text: 'API reply', timeLabel: '', isMine: false),
        ],
      );

      when(() => bloc.state).thenReturn(state1);
      whenListen(bloc, Stream<ChatState>.fromIterable([state1, state2]));

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
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      final scrollable = find.byType(ListView);
      final scrollState = tester.state<ScrollableState>(scrollable);
      expect(
        scrollState.position.pixels,
        closeTo(scrollState.position.maxScrollExtent, 1),
      );
    });

    testWidgets('shows dictionary bottom sheet when a word is tapped', (
      tester,
    ) async {
      final bloc = _MockChatBloc();

      final dictState = buildState(
        wordDictionary: const WordDictionary(
          word: 'Seed',
          meanings: [
            Meaning(
              partOfSpeech: 'noun',
              definitions: [
                DefinitionEntry(definition: 'A unit of reproduction.'),
              ],
            ),
          ],
        ),
        wordStatus: const AppStatus.success(),
        lookup: 'Seed',
      );

      when(() => bloc.state).thenReturn(dictState);
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
            ),
          ),
        ),
      );

      await tester.tap(find.text('Seed'));
      await tester.pumpAndSettle();

      expect(find.byType(DictionaryBottomSheet), findsOneWidget);
      expect(find.textContaining('A unit of reproduction.'), findsOneWidget);
    });
  });
}
