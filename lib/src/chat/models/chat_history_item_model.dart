import 'dart:ui';

import 'package:mini_chat_app/src/src.dart';

class ChatHistoryItem {
  const ChatHistoryItem({
    required this.user,
    required this.preview,
    required this.timeLabel,
  });

  final UserModel user;
  final String preview;
  final String timeLabel;
}

const historyItems = <ChatHistoryItem>[
  ChatHistoryItem(
    user: UserModel(
      name: 'Alice Johnson',
      subtitle: 'See you tomorrow!',
      initials: 'A',
      isOnline: true,
      unreadCount: 2,
      accentColor: Color(0xFF20C580),
    ),
    preview: 'See you tomorrow!',
    timeLabel: '2 min ago',
  ),
  ChatHistoryItem(
    user: UserModel(
      name: 'Bob Smith',
      subtitle: 'Thanks for the help',
      initials: 'B',
      isOnline: false,
      accentColor: Color(0xFF00C26A),
    ),
    preview: 'Thanks for the help',
    timeLabel: '10 min ago',
  ),
  ChatHistoryItem(
    user: UserModel(
      name: 'Carol Williams',
      subtitle: "Let's catch up soon",
      initials: 'C',
      isOnline: false,
      unreadCount: 1,
      accentColor: Color(0xFF00B889),
    ),
    preview: "Let's catch up soon",
    timeLabel: '1 hour ago',
  ),
  ChatHistoryItem(
    user: UserModel(
      name: 'David Brown',
      subtitle: 'Got it, thanks!',
      initials: 'D',
      isOnline: false,
      accentColor: Color(0xFF00B67A),
    ),
    preview: 'Got it, thanks!',
    timeLabel: '3 hours ago',
  ),
  ChatHistoryItem(
    user: UserModel(
      name: 'Emma Davis',
      subtitle: 'Perfect, see you then',
      initials: 'E',
      isOnline: false,
      accentColor: Color(0xFF00B58D),
    ),
    preview: 'Perfect, see you then',
    timeLabel: '5 hours ago',
  ),
  ChatHistoryItem(
    user: UserModel(
      name: 'Frank Miller',
      subtitle: 'That sounds great',
      initials: 'F',
      isOnline: false,
      accentColor: Color(0xFF00C688),
    ),
    preview: 'That sounds great',
    timeLabel: 'Yesterday',
  ),
  ChatHistoryItem(
    user: UserModel(
      name: 'Grace Wilson',
      subtitle: "I'll check it out",
      initials: 'G',
      isOnline: false,
      accentColor: Color(0xFF00BF78),
    ),
    preview: "I'll check it out",
    timeLabel: 'Yesterday',
  ),
  ChatHistoryItem(
    user: UserModel(
      name: 'Henry Moore',
      subtitle: 'Catch up later',
      initials: 'H',
      isOnline: false,
      accentColor: Color(0xFF00C189),
    ),
    preview: 'Catch up later',
    timeLabel: '2 days ago',
  ),
  ChatHistoryItem(
    user: UserModel(
      name: 'Alice Johnson',
      subtitle: 'See you tomorrow!',
      initials: 'A',
      isOnline: true,
      unreadCount: 2,
      accentColor: Color(0xFF20C580),
    ),
    preview: 'See you tomorrow!',
    timeLabel: '2 min ago',
  ),
  ChatHistoryItem(
    user: UserModel(
      name: 'Bob Smith',
      subtitle: 'Thanks for the help',
      initials: 'B',
      isOnline: false,
      accentColor: Color(0xFF00C26A),
    ),
    preview: 'Thanks for the help',
    timeLabel: '10 min ago',
  ),
  ChatHistoryItem(
    user: UserModel(
      name: 'Carol Williams',
      subtitle: "Let's catch up soon",
      initials: 'C',
      isOnline: false,
      unreadCount: 1,
      accentColor: Color(0xFF00B889),
    ),
    preview: "Let's catch up soon",
    timeLabel: '1 hour ago',
  ),
  ChatHistoryItem(
    user: UserModel(
      name: 'David Brown',
      subtitle: 'Got it, thanks!',
      initials: 'D',
      isOnline: false,
      accentColor: Color(0xFF00B67A),
    ),
    preview: 'Got it, thanks!',
    timeLabel: '3 hours ago',
  ),
  ChatHistoryItem(
    user: UserModel(
      name: 'Emma Davis',
      subtitle: 'Perfect, see you then',
      initials: 'E',
      isOnline: false,
      accentColor: Color(0xFF00B58D),
    ),
    preview: 'Perfect, see you then',
    timeLabel: '5 hours ago',
  ),
  ChatHistoryItem(
    user: UserModel(
      name: 'Frank Miller',
      subtitle: 'That sounds great',
      initials: 'F',
      isOnline: false,
      accentColor: Color(0xFF00C688),
    ),
    preview: 'That sounds great',
    timeLabel: 'Yesterday',
  ),
  ChatHistoryItem(
    user: UserModel(
      name: 'Grace Wilson',
      subtitle: "I'll check it out",
      initials: 'G',
      isOnline: false,
      accentColor: Color(0xFF00BF78),
    ),
    preview: "I'll check it out",
    timeLabel: 'Yesterday',
  ),
  ChatHistoryItem(
    user: UserModel(
      name: 'Henry Moore',
      subtitle: 'Catch up later',
      initials: 'H',
      isOnline: false,
      accentColor: Color(0xFF00C189),
    ),
    preview: 'Catch up later',
    timeLabel: '2 days ago',
  ),
];
