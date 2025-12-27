part of 'chat_bloc.dart';

sealed class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object> get props => [];
}

class ChatHistoryRequested extends ChatEvent {}

class WordDefinitionRequested extends ChatEvent {
  const WordDefinitionRequested(this.word);

  final String word;

  @override
  List<Object> get props => [word];
}

class ChatMessageSendRequested extends ChatEvent {
  const ChatMessageSendRequested(this.text);

  final String text;

  @override
  List<Object> get props => [text];
}
