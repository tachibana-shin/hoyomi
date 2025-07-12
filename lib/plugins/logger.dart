import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

class _ConsoleFileOutput extends FileOutput {
  _ConsoleFileOutput({required super.file});

  @override
  void output(OutputEvent event) {
    // ignore: avoid_print
    event.lines.forEach(print);
    super.output(event);
  }
}

late final Logger logger;
Future<void> initializeLogger() async {
  final applicationDir = await getApplicationDocumentsDirectory();
  final logFile = File(
    "${applicationDir.path}/${DateTimeFormat.onlyDate(DateTime.now())}.log",
  );

  logger = Logger(
    printer: PrettyPrinter(),
    output: kDebugMode ? ConsoleOutput() : _ConsoleFileOutput(file: logFile),
  );

  await logger.init;
}
