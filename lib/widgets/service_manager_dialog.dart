import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:hoyomi/core_services/main.dart';
import 'package:hoyomi/core_services/service.dart';
import 'package:hoyomi/utils/get_lang_icon.dart';
import 'package:iconify_flutter/icons/ic.dart';

import 'iconify.dart';

class ServiceManagerItem {
  final String uid;
  final String name;
  final String baseUrl;
  final Widget avatar;
  final String? writeWith;

  const ServiceManagerItem({
    required this.uid,
    required this.name,
    required this.baseUrl,
    required this.avatar,
    required this.writeWith,
  });
}


void showServiceManagerDialog(
  BuildContext context, {
  List<Widget>? actions,
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
            title: Row(
              mainAxisAlignment:
                  actions == null
                      ? MainAxisAlignment.start
                      : MainAxisAlignment.spaceBetween,
              children: [
                const Text("Service Manager"),

                if (actions != null)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: actions,
                  ).expanded(),
              ],
            ),
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
                        title: Row(
                          children: [
                            Text(dialogItems[i].name),
                            if (dialogItems[i].writeWith != null) ...[
                              const SizedBox(width: 6),
                              getLangIcon(context, dialogItems[i].writeWith!)!,
                            ],
                          ],
                        ),
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
