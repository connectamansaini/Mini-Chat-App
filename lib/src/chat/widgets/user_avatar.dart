import 'package:flutter/material.dart';
import 'package:mini_chat_app/src/src.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({required this.user, super.key});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: user.accentColor,
          child: Text(
            user.initials,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        if (user.isOnline)
          const Positioned(
            bottom: -1,
            right: -1,
            child: CircleAvatar(
              radius: 6,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 4.5,
                backgroundColor: Color(0xFF2BD66A),
              ),
            ),
          ),
      ],
    );
  }
}
