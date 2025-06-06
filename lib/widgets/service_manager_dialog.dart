import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:hoyomi/core_services/main.dart';
import 'package:hoyomi/core_services/service.dart';
import 'package:iconify_flutter/icons/ic.dart';

import 'iconify.dart';

class ServiceManagerItem {
  final String uid;
  final String name;
  final String baseUrl;
  final Widget avatar;

  const ServiceManagerItem({
    required this.uid,
    required this.name,
    required this.baseUrl,
    required this.avatar,
  });
}

void showServiceManagerDialog(
  BuildContext context, {
  required List<ServiceManagerItem> items,
  required void Function(List<ServiceManagerItem> items) onDone,
}) {
  List<ServiceManagerItem> dialogItems = List.from(items);

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setStateDialog) {
          return AlertDialog(
            title: const Text("Service Manager"),
            content: SizedBox(
              width: double.maxFinite,
              height: 300,
              child: ReorderableListView(
                onReorder: (oldIndex, newIndex) {
                  setStateDialog(() {
                    if (newIndex > oldIndex) newIndex--;
                    final item = dialogItems.removeAt(oldIndex);
                    dialogItems.insert(newIndex, item);
                  });
                },
                buildDefaultDragHandles: false,
                children: [
                  for (int i = 0; i < dialogItems.length; i++)
                    ReorderableDelayedDragStartListener(
                      key: ValueKey(dialogItems[i]),
                      index: i,
                      child: ListTile(
                        leading:
                            dialogItems[i]
                                .avatar, // AvatarService(dialogItems[i], radius: 10.0),
                        title: Text(dialogItems[i].name),
                        subtitle: Text(dialogItems[i].baseUrl),
                        trailing: const Iconify(
                          Ic.sharp_drag_indicator,
                          size: 20,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            actions: [
              GFButton(
                text: 'Save',
                shape: GFButtonShape.pills,
                onPressed: () async {
                  // setState(() => items = dialogItems);
                  if (!listEquals(dialogItems, items)) {
                    await initializeServices(
                      dialogItems
                          .map((item) => getServiceOrNull(item.uid))
                          .whereType<Service>()
                          .toList(),
                    );
                    onDone(dialogItems);
                  } else if (!dialogItems.indexed.every(
                    (entry) => entry.$2 == items[entry.$1],
                  )) {
                    onDone(dialogItems);
                  }

                  if (!context.mounted) return;
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text("Cancel"),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          );
        },
      );
    },
  );
}
