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
