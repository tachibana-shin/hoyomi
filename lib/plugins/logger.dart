import 'dart:io';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

late final Logger logger;
Future<void> initializeLogger() async {
  final applicationDir = await getApplicationDocumentsDirectory();
  final logFile = File(
    "${applicationDir.path}/${DateTimeFormat.onlyDate(DateTime.now())}.log",
  );

  logger = Logger(printer: PrettyPrinter(), output: FileOutput(file: logFile));
}
