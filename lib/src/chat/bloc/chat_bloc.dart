import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:mini_chat_app/src/chat/usecases/get_word_defination_usecase.dart';
import 'package:mini_chat_app/src/src.dart';

part 'chat_event.dart';
part 'chat_state.dart';

@injectable
class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc(this._getChatHistoryUsecase) : super(const ChatState()) {
    on<ChatHistoryRequested>(_onChatHistoryRequested);
  }

  final GetChatHistoryUsecase _getChatHistoryUsecase;

  Future<void> _onChatHistoryRequested(
    ChatHistoryRequested event,
    Emitter<ChatState> emit,
  ) async {
    emit(state.copyWith(chatHistoryStatus: const AppStatus.loading()));

    final chatHistoryOrFailure = await _getChatHistoryUsecase.call();

    emit(
      chatHistoryOrFailure.fold(
        (failure) => state.copyWith(
          chatHistoryStatus: AppStatus.failure(failure),
        ),
        (_) => state.copyWith(
          chatHistoryStatus: const AppStatus.success(),
        ),
      ),
    );
  }
}
