part of 'chat_bloc.dart';

class ChatState extends Equatable {
  const ChatState({
    this.chatHistoryStatus = const AppStatus.initial(),
    this.commentsResponse = CommentsResponse.empty,
    this.wordDefinitionStatus = const AppStatus.initial(),
    this.wordDefinition = WordDictionary.empty,
    this.lookupWord = '',
  });

  final AppStatus chatHistoryStatus;
  final CommentsResponse commentsResponse;
  final AppStatus wordDefinitionStatus;
  final WordDictionary wordDefinition;
  final String lookupWord;

  @override
  List<Object> get props => [
    chatHistoryStatus,
    commentsResponse,
    wordDefinitionStatus,
    wordDefinition,
    lookupWord,
  ];

  ChatState copyWith({
    AppStatus? chatHistoryStatus,
    CommentsResponse? commentsResponse,
    AppStatus? wordDefinitionStatus,
    WordDictionary? wordDefinition,
    String? lookupWord,
  }) {
    return ChatState(
      chatHistoryStatus: chatHistoryStatus ?? this.chatHistoryStatus,
      commentsResponse: commentsResponse ?? this.commentsResponse,
      wordDefinitionStatus: wordDefinitionStatus ?? this.wordDefinitionStatus,
      wordDefinition: wordDefinition ?? this.wordDefinition,
      lookupWord: lookupWord ?? this.lookupWord,
    );
  }

  @override
  String toString() =>
      'ChatState(chatHistoryStatus: $chatHistoryStatus,'
      ' commentsResponse: $commentsResponse)';
}
