import 'package:clz/src/app/boot.dart';

Future<void> main() async {
  //  This is the main app
  await AppRun.boot(Environment.dev);
}
