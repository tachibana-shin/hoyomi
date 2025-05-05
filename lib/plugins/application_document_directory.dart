import 'dart:io';

import 'package:path_provider/path_provider.dart';

late final Directory applicationDocumentDirectory;

Future<void> initializeApplicationDocumentDirectory() async {
  applicationDocumentDirectory = await getApplicationDocumentsDirectory();
}
