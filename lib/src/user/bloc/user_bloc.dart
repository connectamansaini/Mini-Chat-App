import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mini_chat_app/src/src.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserState()) {
    on<CreateUser>(_onCreateUser);
  }

  void _onCreateUser(CreateUser event, Emitter<UserState> emit) {
    final users = List.of(state.users)
      ..insert(
        0,
        UserModel(
          name: event.name,
          subtitle: '2 min ago',
          initials: event.name[0],
          isOnline: false,
        ),
      );

    emit(state.copyWith(users: users));
  }
}
