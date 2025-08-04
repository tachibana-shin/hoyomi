import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

late final Logger logger;
Future<void> initializeLogger() async {
  final applicationDir = await getApplicationDocumentsDirectory();
  final logsDir = Directory(join(applicationDir.path, 'logs'));
  if (!await logsDir.exists()) await logsDir.create(recursive: true);

  final logFile = File(
    '${applicationDir.path}/logs/${DateTimeFormat.onlyDate(DateTime.now())}.log',
  );

  logger = Logger(
    printer: PrettyPrinter(),
    output: kDebugMode ? ConsoleOutput() : FileOutput(file: logFile),
  );

  await logger.init;
}
