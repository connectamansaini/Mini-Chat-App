import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_chat_app/src/src.dart';

class ChatDetailPage extends StatelessWidget {
  const ChatDetailPage({required this.user, required this.messages, super.key});

  final UserModel user;
  final List<ChatMessage> messages;

  Future<void> _onWordTap(BuildContext context, String rawWord) async {
    final normalized = rawWord.replaceAll(RegExp('[^A-Za-z]'), '');
    if (normalized.isEmpty) return;

    context.read<ChatBloc>().add(WordDefinitionRequested(normalized));

    await showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (sheetContext) => BlocProvider.value(
        value: context.read<ChatBloc>(),
        child: _DictionaryBottomSheet(word: normalized),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF1A1B2F),
        titleSpacing: 0,
        title: Row(
          children: [
            UserAvatar(user: user.copyWith(isOnline: true)),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
                const Text(
                  'Online',
                  style: TextStyle(
                    color: Color(0xFF6B6E7C),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<ChatBloc, ChatState>(
              builder: (context, state) {
                if (state.chatHistoryStatus.isSuccess) {
                  final comments = List.of(state.commentsResponse.comments);
                  final convertedMessages = comments.map(
                    ChatMessage.fromCommentResponse,
                  );

                  final chatMessages = messages + convertedMessages.toList();
                  return ListView.builder(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    itemCount: chatMessages.length,
                    itemBuilder: (context, index) {
                      final message = chatMessages[index];
                      return ChatBubble(
                        message: message,
                        onWordTap: (word) => _onWordTap(context, word),
                      );
                    },
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF1F3F7),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: 'Type a message...',
                        border: InputBorder.none,
                        isDense: true,
                      ),
                      minLines: 1,
                      maxLines: 4,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFF0F6EFF),
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(12),
                  child: const Icon(Icons.send, color: Colors.white, size: 20),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DictionaryBottomSheet extends StatelessWidget {
  const _DictionaryBottomSheet({required this.word});

  final String word;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 28),
      child: BlocBuilder<ChatBloc, ChatState>(
        builder: (context, state) {
          final status = state.wordDefinitionStatus;
          final isCurrentWord =
              state.lookupWord.toLowerCase() == word.toLowerCase();

          if (!isCurrentWord || status.isInitial || status.isLoading) {
            return _DictionaryStateView.loading(word: word);
          }

          if (status.isFailure) {
            final message = status.error?.message ?? 'Unable to load meaning.';
            return _DictionaryStateView.error(
              word: word,
              message: message,
              onRetry: () =>
                  context.read<ChatBloc>().add(WordDefinitionRequested(word)),
            );
          }

          final dictionary = state.wordDefinition;
          if (dictionary.isEmpty || dictionary.meanings.isEmpty) {
            return _DictionaryStateView.empty(word: word);
          }

          return _DictionaryResultView(dictionary: dictionary);
        },
      ),
    );
  }
}

class _DictionaryStateView extends StatelessWidget {
  const _DictionaryStateView._({
    required this.word,
    required this.child,
  });

  factory _DictionaryStateView.loading({required String word}) =>
      _DictionaryStateView._(
        word: word,
        child: const Center(child: CircularProgressIndicator()),
      );

  factory _DictionaryStateView.empty({required String word}) =>
      _DictionaryStateView._(
        word: word,
        child: const Text('No definitions available for this word.'),
      );

  factory _DictionaryStateView.error({
    required String word,
    required String message,
    required VoidCallback onRetry,
  }) => _DictionaryStateView._(
    word: word,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          message,
          style: const TextStyle(
            color: Color(0xFF1A1B2F),
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        ElevatedButton(
          onPressed: onRetry,
          child: const Text('Retry'),
        ),
      ],
    ),
  );

  final String word;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          word,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 12),
        child,
      ],
    );
  }
}

class _DictionaryResultView extends StatelessWidget {
  const _DictionaryResultView({required this.dictionary});

  final WordDictionary dictionary;

  @override
  Widget build(BuildContext context) {
    final entries = dictionary.meanings
        .expand(
          (meaning) => meaning.definitions.map(
            (definition) => (meaning.partOfSpeech, definition),
          ),
        )
        .take(4)
        .toList();

    return SizedBox(
      height: 320,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (dictionary.phonetic.isNotEmpty)
              Text(
                dictionary.phonetic,
                style: const TextStyle(
                  color: Color(0xFF6B6E7C),
                  fontSize: 14,
                ),
              ),
            const SizedBox(height: 12),
            ...entries.map(
              (entry) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (entry.$1.isNotEmpty)
                      Text(
                        entry.$1,
                        style: const TextStyle(
                          color: Color(0xFF0F6EFF),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    Text(
                      entry.$2.definition,
                      style: const TextStyle(
                        color: Color(0xFF1A1B2F),
                        fontSize: 14,
                        height: 1.35,
                      ),
                    ),
                    if (entry.$2.example.isNotEmpty) ...[
                      const SizedBox(height: 4),
                      Text(
                        'Example: ${entry.$2.example}',
                        style: const TextStyle(
                          color: Color(0xFF6B6E7C),
                          fontSize: 13,
                          height: 1.3,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
