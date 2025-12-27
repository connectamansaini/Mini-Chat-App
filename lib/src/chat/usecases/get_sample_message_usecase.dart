import 'package:fabrik_result/fabrik_result.dart';
import 'package:injectable/injectable.dart';
import 'package:mini_chat_app/src/src.dart';

@injectable
class GetSampleMessageUsecase {
  GetSampleMessageUsecase(this.repository);
  final IChatRepository repository;

  Future<Either<AppFailure, Comment>> call({int id = 1}) {
    return repository.getSampleMessage(id: id);
  }
}
