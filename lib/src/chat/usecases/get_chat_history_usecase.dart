import 'package:fabrik_result/fabrik_result.dart';
import 'package:injectable/injectable.dart';
import 'package:mini_chat_app/src/src.dart';

@injectable
class GetChatHistoryUsecase {
  GetChatHistoryUsecase(this.repository);
  final IChatRepository repository;

  Future<Either<AppFailure, CommentsResponse>> call() {
    return repository.getChatHistory();
  }
}
