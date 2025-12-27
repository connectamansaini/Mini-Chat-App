import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:mini_chat_app/src/src.dart';

part 'chat_event.dart';
part 'chat_state.dart';

@injectable
class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc(
    this._getChatHistoryUsecase,
    this._getWordDefinitionUsecase,
    this._getSampleMessageUsecase,
  ) : super(const ChatState()) {
    on<ChatHistoryRequested>(_onChatHistoryRequested);
    on<WordDefinitionRequested>(_onWordDefinitionRequested);
    on<ChatMessageSendRequested>(_onChatMessageSendRequested);
  }

  final GetChatHistoryUsecase _getChatHistoryUsecase;
  final GetWordDefinitionUsecase _getWordDefinitionUsecase;
  final GetSampleMessageUsecase _getSampleMessageUsecase;

  Future<void> _onChatHistoryRequested(
    ChatHistoryRequested event,
    Emitter<ChatState> emit,
  ) async {
    emit(state.copyWith(chatHistoryStatus: const AppStatus.loading()));

    final commentOrFailure = await _getChatHistoryUsecase.call();

    emit(
      commentOrFailure.fold(
        (failure) => state.copyWith(
          chatHistoryStatus: AppStatus.failure(failure),
        ),
        (commentsResponse) => state.copyWith(
          chatHistoryStatus: const AppStatus.success(),
          commentsResponse: commentsResponse,
        ),
      ),
    );
  }

  Future<void> _onWordDefinitionRequested(
    WordDefinitionRequested event,
    Emitter<ChatState> emit,
  ) async {
    final sanitized = event.word.trim().replaceAll(RegExp('[^A-Za-z]'), '');
    if (sanitized.isEmpty) return;

    emit(
      state.copyWith(
        wordDefinitionStatus: const AppStatus.loading(),
        wordDefinition: WordDictionary.empty,
        lookupWord: sanitized,
      ),
    );

    final definitionOrFailure = await _getWordDefinitionUsecase.call(
      sanitized.toLowerCase(),
    );

    emit(
      definitionOrFailure.fold(
        (failure) => state.copyWith(
          wordDefinitionStatus: AppStatus.failure(failure),
        ),
        (definition) => state.copyWith(
          wordDefinitionStatus: const AppStatus.success(),
          wordDefinition: definition,
        ),
      ),
    );
  }

  Future<void> _onChatMessageSendRequested(
    ChatMessageSendRequested event,
    Emitter<ChatState> emit,
  ) async {
    final text = event.text.trim();
    if (text.isEmpty) return;

    final userMessage = ChatMessage(
      text: text,
      timeLabel: '',
      isMine: true,
    );

    emit(
      state.copyWith(
        sendMessageStatus: const AppStatus.loading(),
        sentMessages: [...state.sentMessages, userMessage],
      ),
    );

    final responseOrFailure = await _getSampleMessageUsecase.call(
      id: state.sentMessages.length + 1,
    );

    emit(
      responseOrFailure.fold(
        (failure) => state.copyWith(
          sendMessageStatus: AppStatus.failure(failure),
        ),
        (comment) => state.copyWith(
          sendMessageStatus: const AppStatus.success(),
          sentMessages: [
            ...state.sentMessages,
            ChatMessage.fromCommentResponse(response: comment, isEven: false),
          ],
        ),
      ),
    );
  }
}
