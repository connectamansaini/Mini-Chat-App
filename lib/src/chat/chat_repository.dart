import 'package:fabrik_result/fabrik_result.dart';
import 'package:injectable/injectable.dart';
import 'package:mini_chat_app/src/src.dart';

abstract class IChatRepository {
  Future<Either<AppFailure, Unit>> getChatHistory();
  Future<Either<AppFailure, WordDictionary>> getWordDictionary(String word);
}

@LazySingleton(as: IChatRepository)
class ChatRepository implements IChatRepository {
  ChatRepository({required this.chatService});
  final ChatService chatService;

  @override
  Future<Either<AppFailure, Unit>> getChatHistory() async {
    try {
      await chatService.getChatHistory();
      return right(unit);
    } on AppFailure catch (f) {
      return left(f);
    } on Object catch (e, st) {
      return left(AppFailure.unexpected(e, st));
    }
  }

  @override
  Future<Either<AppFailure, WordDictionary>> getWordDictionary(
    String word,
  ) async {
    try {
      final definition = await chatService.getWordDictionary(word);
      return right(definition.toEntity);
    } on AppFailure catch (f) {
      return left(f);
    } on Object catch (e, st) {
      return left(AppFailure.unexpected(e, st));
    }
  }
}
