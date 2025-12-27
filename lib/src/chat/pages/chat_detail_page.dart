import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_chat_app/src/src.dart';

class ChatDetailPage extends StatefulWidget {
  const ChatDetailPage({required this.user, required this.messages, super.key});

  final UserModel user;
  final List<ChatMessage> messages;

  @override
  State<ChatDetailPage> createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  int _lastMessageCount = 0;

  @override
  void dispose() {
    _scrollController.dispose();
    _messageController.dispose();
    super.dispose();
  }

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
        child: DictionaryBottomSheet(word: normalized),
      ),
    );
  }

  void _onSendTap(BuildContext context) {
    final text = _messageController.text.trim();
    if (text.isEmpty) return;
    context.read<ChatBloc>().add(ChatMessageSendRequested(text));
    _messageController.clear();
  }

  List<ChatMessage> _buildMessages(ChatState state) {
    final comments = List.of(state.commentsResponse.comments);
    final convertedMessages = comments.map(ChatMessage.fromCommentResponse);

    return [
      ...widget.messages,
      ...convertedMessages,
      ...state.sentMessages,
    ];
  }

  void _scrollToBottom() {
    if (!_scrollController.hasClients) return;
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!_scrollController.hasClients) return;
      await _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
      );
    });
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
            UserAvatar(user: widget.user.copyWith(isOnline: true)),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.user.name,
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
            child: BlocConsumer<ChatBloc, ChatState>(
              listener: (context, state) {
                final chatMessages = _buildMessages(state);
                if (chatMessages.length > _lastMessageCount) {
                  _scrollToBottom();
                }
                _lastMessageCount = chatMessages.length;
              },
              builder: (context, state) {
                if (state.chatHistoryStatus.isLoading ||
                    state.chatHistoryStatus.isInitial) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state.chatHistoryStatus.isFailure) {
                  final message =
                      state.chatHistoryStatus.error?.message ?? 'Load failed';
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        message,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      ElevatedButton(
                        onPressed: () => context.read<ChatBloc>().add(
                          ChatHistoryRequested(),
                        ),
                        child: const Text('Retry'),
                      ),
                    ],
                  );
                }

                final chatMessages = _buildMessages(state);
                if (chatMessages.isEmpty) {
                  return const Center(child: Text('No messages yet.'));
                }

                return ListView.builder(
                  controller: _scrollController,
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
                    child: TextField(
                      controller: _messageController,
                      autocorrect: true,
                      textCapitalization: TextCapitalization.sentences,
                      decoration: const InputDecoration(
                        hintText: 'Type a message...',
                        border: InputBorder.none,
                        isDense: true,
                      ),
                      onSubmitted: (_) => _onSendTap(context),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                InkWell(
                  onTap: () => _onSendTap(context),
                  borderRadius: BorderRadius.circular(32),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFF0F6EFF),
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(12),
                    child: const Icon(
                      Icons.send,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DictionaryBottomSheet extends StatelessWidget {
  const DictionaryBottomSheet({required this.word, super.key});

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
            return DictionaryStateView.loading(word: word);
          }

          if (status.isFailure) {
            final message = status.error?.message ?? 'Unable to load meaning.';
            return DictionaryStateView.error(
              word: word,
              message: message,
              onRetry: () =>
                  context.read<ChatBloc>().add(WordDefinitionRequested(word)),
            );
          }

          final dictionary = state.wordDefinition;
          if (dictionary.isEmpty || dictionary.meanings.isEmpty) {
            return DictionaryStateView.empty(word: word);
          }

          return DictionaryResultView(dictionary: dictionary);
        },
      ),
    );
  }
}

class DictionaryStateView extends StatelessWidget {
  const DictionaryStateView._({
    required this.word,
    required this.child,
  });

  factory DictionaryStateView.loading({required String word}) =>
      DictionaryStateView._(
        word: word,
        child: const Center(child: CircularProgressIndicator()),
      );

  factory DictionaryStateView.empty({required String word}) =>
      DictionaryStateView._(
        word: word,
        child: const Text('No definitions available for this word.'),
      );

  factory DictionaryStateView.error({
    required String word,
    required String message,
    required VoidCallback onRetry,
  }) => DictionaryStateView._(
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

class DictionaryResultView extends StatelessWidget {
  const DictionaryResultView({required this.dictionary, super.key});

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
