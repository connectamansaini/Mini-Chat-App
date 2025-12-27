import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:mini_chat_app/src/src.dart';

@lazySingleton
class ChatService {
  ChatService();

  final dio = Dio();

  Future<CommentsResponseModel> getChatHistory() async {
    try {
      final response = await dio.get<dynamic>(
        'https://dummyjson.com/comments',
      );

      final result = CommentsResponseModel.fromJson(
        response.data as Map<String, dynamic>,
      );

      return result;
    } on AppFailure {
      rethrow;
    } catch (e, st) {
      throw AppFailure.unexpected(e, st);
    }
  }

  Future<WordDictionaryModel> getWordDictionary(String word) async {
    try {
      final response = await dio.get<dynamic>(
        'https://api.dictionaryapi.dev/api/v2/entries/en/$word',
      );

      final data = response.data as List<dynamic>;
      if (data.isEmpty) {
        throw AppFailure.validation('No definitions found for "$word".');
      }

      final first = data.first as Map<String, dynamic>;
      return WordDictionaryModel.fromJson(first);
    } on AppFailure {
      rethrow;
    } catch (e, st) {
      throw AppFailure.unexpected(e, st);
    }
  }

  Future<CommentModel> getSampleMessage({int id = 1}) async {
    try {
      final response = await dio.get<dynamic>(
        'https://dummyjson.com/comments/$id',
      );

      final data = response.data as Map<String, dynamic>;
      return CommentModel.fromJson(data);
    } on AppFailure {
      rethrow;
    } catch (e, st) {
      throw AppFailure.unexpected(e, st);
    }
  }
}
