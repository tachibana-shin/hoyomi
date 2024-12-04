import 'package:flutter/material.dart';
import 'package:honyomi/objectbox.g.dart';

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class ObjectBox {
  /// The Store of this app.
  late final Store store;

  ObjectBox._create(this.store) {
    // Add any additional setup code, e.g. build queries.
  }

  /// Create an instance of ObjectBox to use throughout the app.
  static Future<ObjectBox> create() async {
    final docsDir = await getApplicationDocumentsDirectory();
    // Future<Store> openStore() {...} is defined in the generated objectbox.g.dart
    final store = await openStore(directory: p.join(docsDir.path, "obx"));
    return ObjectBox._create(store);
  }
}

late ObjectBox objectBox;

Future<void> initObjectBox() async {
  WidgetsFlutterBinding.ensureInitialized();
  objectBox = await ObjectBox.create();
}
