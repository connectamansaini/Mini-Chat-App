import 'package:bloc_test/bloc_test.dart';
import 'package:fabrik_result/fabrik_result.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mini_chat_app/src/src.dart';
import 'package:mocktail/mocktail.dart';

class _MockGetChatHistoryUsecase extends Mock
    implements GetChatHistoryUsecase {}

class _MockGetWordDefinitionUsecase extends Mock
    implements GetWordDefinitionUsecase {}

class _MockGetSampleMessageUsecase extends Mock
    implements GetSampleMessageUsecase {}

void main() {
  late _MockGetChatHistoryUsecase getChatHistoryUsecase;
  late _MockGetWordDefinitionUsecase getWordDefinitionUsecase;
  late _MockGetSampleMessageUsecase getSampleMessageUsecase;
  late ChatBloc bloc;

  const sampleComment = Comment(
    id: 1,
    body: 'Hello from API',
    postId: 1,
    user: CommentUser(id: 7, username: 'api_user', fullName: 'Api User'),
  );

  const sampleResponse = CommentsResponse(comments: [sampleComment]);

  const sampleDictionary = WordDictionary(
    word: 'about',
    phonetic: '/əˈbaʊt/',
    meanings: [
      Meaning(
        partOfSpeech: 'preposition',
        definitions: [
          DefinitionEntry(definition: 'On the subject of; concerning.'),
        ],
      ),
    ],
  );

  setUp(() {
    getChatHistoryUsecase = _MockGetChatHistoryUsecase();
    getWordDefinitionUsecase = _MockGetWordDefinitionUsecase();
    getSampleMessageUsecase = _MockGetSampleMessageUsecase();

    bloc = ChatBloc(
      getChatHistoryUsecase,
      getWordDefinitionUsecase,
      getSampleMessageUsecase,
    );
  });

  tearDown(() => bloc.close());

  group('ChatHistoryRequested', () {
    blocTest<ChatBloc, ChatState>(
      'emits loading then success with comments',
      build: () {
        when(
          () => getChatHistoryUsecase.call(),
        ).thenAnswer((_) async => right(sampleResponse));
        return bloc;
      },
      act: (bloc) => bloc.add(ChatHistoryRequested()),
      expect: () => [
        isA<ChatState>().having(
          (s) => s.chatHistoryStatus.isLoading,
          'loading',
          true,
        ),
        isA<ChatState>()
            .having((s) => s.chatHistoryStatus.isSuccess, 'success', true)
            .having(
              (s) => s.commentsResponse.comments,
              'comments',
              sampleResponse.comments,
            ),
      ],
      verify: (_) => verify(() => getChatHistoryUsecase.call()).called(1),
    );

    blocTest<ChatBloc, ChatState>(
      'emits loading then failure on error',
      build: () {
        when(() => getChatHistoryUsecase.call()).thenAnswer(
          (_) async => left(AppFailure.network(message: 'no net')),
        );
        return bloc;
      },
      act: (bloc) => bloc.add(ChatHistoryRequested()),
      expect: () => [
        isA<ChatState>().having(
          (s) => s.chatHistoryStatus.isLoading,
          'loading',
          true,
        ),
        isA<ChatState>().having(
          (s) => s.chatHistoryStatus.isFailure,
          'failure',
          true,
        ),
      ],
    );
  });

  group('WordDefinitionRequested', () {
    blocTest<ChatBloc, ChatState>(
      'emits loading then success with dictionary',
      build: () {
        when(
          () => getWordDefinitionUsecase.call('about'),
        ).thenAnswer((_) async => right(sampleDictionary));
        return bloc;
      },
      act: (bloc) => bloc.add(const WordDefinitionRequested('about')),
      expect: () => [
        isA<ChatState>().having(
          (s) => s.wordDefinitionStatus.isLoading,
          'loading',
          true,
        ),
        isA<ChatState>()
            .having((s) => s.wordDefinitionStatus.isSuccess, 'success', true)
            .having((s) => s.wordDefinition.word, 'word', 'about'),
      ],
    );

    blocTest<ChatBloc, ChatState>(
      'emits loading then failure on dictionary error',
      build: () {
        when(() => getWordDefinitionUsecase.call('about')).thenAnswer(
          (_) async => left(AppFailure.validation('bad word')),
        );
        return bloc;
      },
      act: (bloc) => bloc.add(const WordDefinitionRequested('about')),
      expect: () => [
        isA<ChatState>().having(
          (s) => s.wordDefinitionStatus.isLoading,
          'loading',
          true,
        ),
        isA<ChatState>().having(
          (s) => s.wordDefinitionStatus.isFailure,
          'failure',
          true,
        ),
      ],
    );
  });

  group('ChatMessageSendRequested', () {
    blocTest<ChatBloc, ChatState>(
      'appends user message then API reply on success',
      build: () {
        when(() => getSampleMessageUsecase.call()).thenAnswer(
          (_) async => right(sampleComment),
        );
        return bloc;
      },
      act: (bloc) => bloc.add(const ChatMessageSendRequested('Hi there')),
      expect: () => [
        isA<ChatState>()
            .having((s) => s.sendMessageStatus.isLoading, 'loading', true)
            .having((s) => s.sentMessages.length, 'user message count', 1)
            .having((s) => s.sentMessages.first.isMine, 'user isMine', true)
            .having((s) => s.sentMessages.first.text, 'user text', 'Hi there'),
        isA<ChatState>()
            .having((s) => s.sendMessageStatus.isSuccess, 'success', true)
            .having((s) => s.sentMessages.length, 'total messages', 2)
            .having((s) => s.sentMessages.last.isMine, 'reply isMine', false)
            .having(
              (s) => s.sentMessages.last.text,
              'reply text',
              sampleComment.body,
            ),
      ],
    );

    blocTest<ChatBloc, ChatState>(
      'emits loading then failure when send fails',
      build: () {
        when(() => getSampleMessageUsecase.call()).thenAnswer(
          (_) async => left(AppFailure.network(message: 'offline')),
        );
        return bloc;
      },
      act: (bloc) => bloc.add(const ChatMessageSendRequested('Hi there')),
      expect: () => [
        isA<ChatState>()
            .having((s) => s.sendMessageStatus.isLoading, 'loading', true)
            .having((s) => s.sentMessages.length, 'user message count', 1),
        isA<ChatState>().having(
          (s) => s.sendMessageStatus.isFailure,
          'failure',
          true,
        ),
      ],
    );

    blocTest<ChatBloc, ChatState>(
      'emits nothing when message text is empty',
      build: () => bloc,
      act: (bloc) => bloc.add(const ChatMessageSendRequested('   ')),
      expect: () => <ChatState>[],
    );
  });
}
