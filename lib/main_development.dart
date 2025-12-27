import 'package:injectable/injectable.dart';
import 'package:mini_chat_app/app/app.dart';
import 'package:mini_chat_app/app/injector.dart';
import 'package:mini_chat_app/bootstrap.dart';

Future<void> main() async {
  await configureInjector(Environment.dev);

  await bootstrap(() => const App());
}
