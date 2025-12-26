part of 'chat_bloc.dart';

class ChatState extends Equatable {
  const ChatState({
    this.chatHistoryStatus = const AppStatus.initial(),
  });

  final AppStatus chatHistoryStatus;

  @override
  List<Object> get props => [chatHistoryStatus];

  ChatState copyWith({
    AppStatus? chatHistoryStatus,
  }) {
    return ChatState(
      chatHistoryStatus: chatHistoryStatus ?? this.chatHistoryStatus,
    );
  }

  @override
  String toString() => 'ChatState(chatHistoryStatus: $chatHistoryStatus)';
}
