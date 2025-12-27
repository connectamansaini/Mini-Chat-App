// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:mini_chat_app/src/chat/bloc/chat_bloc.dart' as _i943;
import 'package:mini_chat_app/src/chat/chat_repository.dart' as _i275;
import 'package:mini_chat_app/src/chat/chat_service.dart' as _i508;
import 'package:mini_chat_app/src/chat/usecases/get_chat_history_usecase.dart'
    as _i842;
import 'package:mini_chat_app/src/chat/usecases/get_word_defination_usecase.dart'
    as _i251;
import 'package:mini_chat_app/src/src.dart' as _i976;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i508.ChatService>(() => _i508.ChatService());
    gh.lazySingleton<_i275.IChatRepository>(
      () => _i275.ChatRepository(chatService: gh<_i976.ChatService>()),
    );
    gh.factory<_i842.GetChatHistoryUsecase>(
      () => _i842.GetChatHistoryUsecase(gh<_i976.IChatRepository>()),
    );
    gh.factory<_i251.GetWordDefinitionUsecase>(
      () => _i251.GetWordDefinitionUsecase(gh<_i976.IChatRepository>()),
    );
    gh.factory<_i943.ChatBloc>(
      () => _i943.ChatBloc(
        gh<_i976.GetChatHistoryUsecase>(),
        gh<_i976.GetWordDefinitionUsecase>(),
      ),
    );
    return this;
  }
}
