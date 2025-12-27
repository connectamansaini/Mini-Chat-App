import 'package:mini_chat_app/src/src.dart';

class ChatMessage {
  const ChatMessage({
    required this.text,
    required this.timeLabel,
    required this.isMine,
  });

  factory ChatMessage.fromCommentResponse({
    required Comment response,
    bool isEven = true,
  }) {
    return ChatMessage(
      text: response.body,
      timeLabel: (() {
        final date = DateTime.now().subtract(Duration(minutes: response.id));
        final hour = date.hour % 12 == 0 ? 12 : date.hour % 12;
        final minute = date.minute.toString().padLeft(2, '0');
        final period = date.hour >= 12 ? 'PM' : 'AM';
        return '$hour:$minute $period';
      })(),
      isMine: isEven && response.id.isEven,
    );
  }

  final String text;
  final String timeLabel;
  final bool isMine;
}
