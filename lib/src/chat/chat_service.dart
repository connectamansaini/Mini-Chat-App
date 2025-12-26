import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fabrik_result/fabrik_result.dart';
import 'package:injectable/injectable.dart';
import 'package:mini_chat_app/core/app_failure.dart';
import 'package:mini_chat_app/src/chat/models/word_dictionary_model.dart';

@lazySingleton
class ChatService {
  ChatService();

  final dio = Dio();

  Future<Unit> getChatHistory() async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        'https://dummyjson.com/comments',
      );

      log(response.data.toString());
      return unit;
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

      final data = response.data as List<Map<String, dynamic>>;
      return WordDictionaryModel.fromJson(data[0]);
    } on AppFailure {
      rethrow;
    } catch (e, st) {
      throw AppFailure.unexpected(e, st);
    }
  }
}
