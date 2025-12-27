part of 'chat_bloc.dart';

class ChatState extends Equatable {
  const ChatState({
    this.chatHistoryStatus = const AppStatus.initial(),
    this.commentsResponse = CommentsResponse.empty,
    this.wordDefinitionStatus = const AppStatus.initial(),
    this.wordDefinition = WordDictionary.empty,
    this.lookupWord = '',
    this.sendMessageStatus = const AppStatus.initial(),
    this.sentMessages = const [],
  });

  final AppStatus chatHistoryStatus;
  final CommentsResponse commentsResponse;
  final AppStatus wordDefinitionStatus;
  final WordDictionary wordDefinition;
  final String lookupWord;
  final AppStatus sendMessageStatus;
  final List<ChatMessage> sentMessages;

  @override
  List<Object> get props => [
    chatHistoryStatus,
    commentsResponse,
    wordDefinitionStatus,
    wordDefinition,
    lookupWord,
    sendMessageStatus,
    sentMessages,
  ];

  ChatState copyWith({
    AppStatus? chatHistoryStatus,
    CommentsResponse? commentsResponse,
    AppStatus? wordDefinitionStatus,
    WordDictionary? wordDefinition,
    String? lookupWord,
    AppStatus? sendMessageStatus,
    List<ChatMessage>? sentMessages,
  }) {
    return ChatState(
      chatHistoryStatus: chatHistoryStatus ?? this.chatHistoryStatus,
      commentsResponse: commentsResponse ?? this.commentsResponse,
      wordDefinitionStatus: wordDefinitionStatus ?? this.wordDefinitionStatus,
      wordDefinition: wordDefinition ?? this.wordDefinition,
      lookupWord: lookupWord ?? this.lookupWord,
      sendMessageStatus: sendMessageStatus ?? this.sendMessageStatus,
      sentMessages: sentMessages ?? this.sentMessages,
    );
  }

  @override
  String toString() =>
      'ChatState(chatHistoryStatus: $chatHistoryStatus,'
      ' commentsResponse: $commentsResponse)';
}
