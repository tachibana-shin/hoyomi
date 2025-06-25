import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hoyomi/core_services/main.dart';
import 'package:hoyomi/core_services/service.dart';
import 'package:hoyomi/utils/get_lang_icon.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:sealed_languages/sealed_languages.dart';

import 'iconify.dart';

class ServiceManagerItem {
  final String uid;
  final String name;
  final String baseUrl;
  final Widget avatar;
  final String? writeWith;
  final String? version;
  final String? description;

  /// Code language support
  final String? language;

  const ServiceManagerItem({
    required this.uid,
    required this.name,
    required this.baseUrl,
    required this.avatar,
    required this.writeWith,
    required this.version,
    required this.description,
    required this.language,
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
                            Text(
                              dialogItems[i].name,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            if (dialogItems[i].writeWith != null &&
                                dialogItems[i].writeWith != 'dart') ...[
                              const SizedBox(width: 6),
                              getLangIcon(context, dialogItems[i].writeWith!)!,
                            ],
                          ],
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                if (dialogItems[i].version != null)
                                  Text(
                                    'v${dialogItems[i].version} ',
                                  ).fontSize(12),
                                if (dialogItems[i].language != null)
                                  Text(
                                    ' ${NaturalLanguage.codeShortMap[dialogItems[i].language!.toUpperCase()]?.name ?? dialogItems[i].language}',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color:
                                          Theme.of(
                                            context,
                                          ).textTheme.bodySmall?.color,
                                    ),
                                  ),
                              ],
                            ),
                            Text(dialogItems[i].baseUrl).fontSize(12),

                            // if (dialogItems[i].description != null)
                            //   Text(
                            //     dialogItems[i].description!,
                            //     maxLines: 2,
                            //     overflow: TextOverflow.ellipsis,
                            //     style: TextStyle(
                            //       fontSize: 12,
                            //       color:
                            //           Theme.of(
                            //             context,
                            //           ).textTheme.bodySmall?.color,
                            //     ),
                            //   ),
                          ],
                        ),

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
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                    Theme.of(context).colorScheme.primary,
                  ),
                ),
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
                child: Text(
                  'Save',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
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
