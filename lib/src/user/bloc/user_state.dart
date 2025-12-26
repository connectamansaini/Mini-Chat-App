part of 'user_bloc.dart';

class UserState extends Equatable {
  const UserState({
    // this.users = const [],
    this.users = mockUsers,
  });

  final List<UserModel> users;

  @override
  List<Object> get props => [users];

  UserState copyWith({
    List<UserModel>? users,
  }) {
    return UserState(
      users: users ?? this.users,
    );
  }

  @override
  String toString() => 'UserState(users: $users)';
}
