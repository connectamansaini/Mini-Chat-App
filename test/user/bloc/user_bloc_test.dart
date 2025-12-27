import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mini_chat_app/src/src.dart';

void main() {
  group('UserBloc', () {
    blocTest<UserBloc, UserState>(
      'inserts new user at the top when CreateUser is added',
      build: UserBloc.new,
      act: (bloc) => bloc.add(const CreateUser('Zelda')),
      expect: () => [
        isA<UserState>()
            .having((s) => s.users.first.name, 'first user name', 'Zelda')
            .having((s) => s.users.first.initials, 'initials', 'Z'),
      ],
    );
  });
}
