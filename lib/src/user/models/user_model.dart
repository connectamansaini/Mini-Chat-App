import 'dart:ui';

class UserModel {
  const UserModel({
    required this.name,
    required this.subtitle,
    required this.initials,
    required this.isOnline,
    this.unreadCount = 0,
    this.accentColor = const Color(0xFF0F6EFF),
  });

  final String name;
  final String subtitle;
  final String initials;
  final bool isOnline;
  final int unreadCount;
  final Color accentColor;

  UserModel copyWith({bool? isOnline}) => UserModel(
    name: name,
    subtitle: subtitle,
    initials: initials,
    isOnline: isOnline ?? this.isOnline,
    unreadCount: unreadCount,
    accentColor: accentColor,
  );
}

const mockUsers = <UserModel>[
  UserModel(
    name: 'Alice Johnson',
    subtitle: 'Online',
    initials: 'A',
    isOnline: true,
    accentColor: Color(0xFF586BFC),
  ),
  UserModel(
    name: 'Bob Smith',
    subtitle: '2 min ago',
    initials: 'B',
    isOnline: false,
    accentColor: Color(0xFF7261E3),
  ),
  UserModel(
    name: 'Carol Williams',
    subtitle: 'Online',
    initials: 'C',
    isOnline: true,
    accentColor: Color(0xFF4CB050),
  ),
  UserModel(
    name: 'David Brown',
    subtitle: '1 hour ago',
    initials: 'D',
    isOnline: false,
    accentColor: Color(0xFFB868F8),
  ),
  UserModel(
    name: 'Emma Davis',
    subtitle: 'Online',
    initials: 'E',
    isOnline: true,
    accentColor: Color(0xFF7D6BF2),
  ),
  UserModel(
    name: 'Frank Miller',
    subtitle: '5 min ago',
    initials: 'F',
    isOnline: false,
    accentColor: Color(0xFF5C67F6),
  ),
  UserModel(
    name: 'Grace Wilson',
    subtitle: 'Online',
    initials: 'G',
    isOnline: true,
    accentColor: Color(0xFF25D18A),
  ),
  UserModel(
    name: 'Henry Moore',
    subtitle: 'Yesterday',
    initials: 'H',
    isOnline: false,
    accentColor: Color(0xFFE45771),
  ),
  UserModel(
    name: 'Alice Johnson',
    subtitle: 'Online',
    initials: 'A',
    isOnline: true,
    accentColor: Color(0xFF586BFC),
  ),
  UserModel(
    name: 'Bob Smith',
    subtitle: '2 min ago',
    initials: 'B',
    isOnline: false,
    accentColor: Color(0xFF7261E3),
  ),
  UserModel(
    name: 'Carol Williams',
    subtitle: 'Online',
    initials: 'C',
    isOnline: true,
    accentColor: Color(0xFF4CB050),
  ),
  UserModel(
    name: 'David Brown',
    subtitle: '1 hour ago',
    initials: 'D',
    isOnline: false,
    accentColor: Color(0xFFB868F8),
  ),
  UserModel(
    name: 'Emma Davis',
    subtitle: 'Online',
    initials: 'E',
    isOnline: true,
    accentColor: Color(0xFF7D6BF2),
  ),
  UserModel(
    name: 'Frank Miller',
    subtitle: '5 min ago',
    initials: 'F',
    isOnline: false,
    accentColor: Color(0xFF5C67F6),
  ),
  UserModel(
    name: 'Grace Wilson',
    subtitle: 'Online',
    initials: 'G',
    isOnline: true,
    accentColor: Color(0xFF25D18A),
  ),
  UserModel(
    name: 'Henry Moore',
    subtitle: 'Yesterday',
    initials: 'H',
    isOnline: false,
    accentColor: Color(0xFFE45771),
  ),
];
