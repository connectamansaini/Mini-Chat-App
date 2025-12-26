part of 'user_bloc.dart';

sealed class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class CreateUser extends UserEvent {
  const CreateUser(this.name);

  final String name;

  @override
  List<Object> get props => [name];
}
