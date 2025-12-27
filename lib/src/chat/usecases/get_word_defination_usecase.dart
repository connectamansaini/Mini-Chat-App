import 'package:fabrik_result/fabrik_result.dart';
import 'package:injectable/injectable.dart';
import 'package:mini_chat_app/src/src.dart';

@injectable
class GetWordDefinitionUsecase {
  GetWordDefinitionUsecase(this.repository);
  final IChatRepository repository;

  Future<Either<AppFailure, WordDictionary>> call(String word) {
    return repository.getWordDictionary(word);
  }
}
