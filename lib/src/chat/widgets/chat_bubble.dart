import 'package:flutter/material.dart';
import 'package:mini_chat_app/src/src.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    required this.message,
    required this.onWordTap,
    super.key,
  });

  final ChatMessage message;
  final ValueChanged<String> onWordTap;

  @override
  Widget build(BuildContext context) {
    final alignment = message.isMine
        ? Alignment.centerRight
        : Alignment.centerLeft;
    final bubbleColor = message.isMine ? const Color(0xFF0F6EFF) : Colors.white;
    final textColor = message.isMine ? Colors.white : const Color(0xFF1A1B2F);

    return Align(
      alignment: alignment,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Column(
          crossAxisAlignment: message.isMine
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          children: [
            Container(
              constraints: const BoxConstraints(maxWidth: 320),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              decoration: BoxDecoration(
                color: bubbleColor,
                borderRadius: BorderRadius.circular(14),
              ),
              child: MessageText(
                message: message,
                textColor: textColor,
                onWordTap: onWordTap,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              message.timeLabel,
              style: const TextStyle(
                color: Color(0xFF8C91A0),
                fontSize: 11.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageText extends StatelessWidget {
  const MessageText({
    required this.message,
    required this.textColor,
    required this.onWordTap,
    super.key,
  });

  final ChatMessage message;
  final Color textColor;
  final ValueChanged<String> onWordTap;

  @override
  Widget build(BuildContext context) {
    final spans = _buildSpans(message.text);
    return RichText(
      text: TextSpan(
        children: spans,
        style: TextStyle(
          color: textColor,
          fontSize: 14.5,
          height: 1.4,
        ),
      ),
    );
  }

  List<InlineSpan> _buildSpans(String text) {
    final spans = <InlineSpan>[];
    final wordPattern = RegExp("[A-Za-z']+");
    var index = 0;

    for (final match in wordPattern.allMatches(text)) {
      if (match.start > index) {
        spans.add(TextSpan(text: text.substring(index, match.start)));
      }

      final word = match.group(0) ?? '';
      spans.add(
        WidgetSpan(
          alignment: PlaceholderAlignment.baseline,
          baseline: TextBaseline.alphabetic,
          child: GestureDetector(
            onTap: () => onWordTap(word),
            onLongPress: () => onWordTap(word),
            behavior: HitTestBehavior.translucent,
            child: Text(
              word,
              style: TextStyle(
                color: textColor,
                fontSize: 14.5,
                height: 1.4,
                decorationColor: textColor.withAlpha(89),
              ),
            ),
          ),
        ),
      );
      index = match.end;
    }

    if (index < text.length) {
      spans.add(TextSpan(text: text.substring(index)));
    }

    return spans;
  }
}
