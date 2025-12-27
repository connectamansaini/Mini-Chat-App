import 'package:mini_chat_app/src/src.dart';

class ChatMessage {
  const ChatMessage({
    required this.text,
    required this.timeLabel,
    required this.isMine,
  });

  factory ChatMessage.fromCommentResponse(Comment response) {
    return ChatMessage(
      text: response.body,
      timeLabel: '',
      isMine: false,
    );
  }

  final String text;
  final String timeLabel;
  final bool isMine;
}

const messages = <ChatMessage>[
  ChatMessage(
    text: 'Hey! How are you doing?',
    timeLabel: '10:30 AM',
    isMine: false,
  ),
  ChatMessage(
    text: "I'm doing great, thanks! How about you?",
    timeLabel: '10:31 AM',
    isMine: true,
  ),
  ChatMessage(
    text: 'Pretty good! Just wanted to check in about the project.',
    timeLabel: '10:32 AM',
    isMine: false,
  ),
  ChatMessage(
    text: "Oh yes, I've been making good progress on it.",
    timeLabel: '10:33 AM',
    isMine: true,
  ),
  ChatMessage(
    text: 'Should be ready by tomorrow.',
    timeLabel: '10:33 AM',
    isMine: true,
  ),
  ChatMessage(
    text: "That's awesome! Let me know if you need any help.",
    timeLabel: '10:34 AM',
    isMine: false,
  ),
  ChatMessage(text: 'Will do, thanks!', timeLabel: '10:35 AM', isMine: true),
];
