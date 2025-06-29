import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hoyomi/core_services/main.dart';
import 'package:hoyomi/core_services/service.dart';
import 'package:hoyomi/utils/get_lang_icon.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:kaeru/kaeru.dart';
import 'package:sealed_languages/sealed_languages.dart';

import 'iconify.dart';

class ServiceManagerItem {
  final String? uid;
  final String? name;
  final Widget? avatar;
  final Service? service;

  const ServiceManagerItem({this.uid, this.name, this.avatar, this.service});
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
                      child:
                          dialogItems[i].service != null
                              ? ItemServiceManager((
                                service: dialogItems[i].service!,
                                onTap: null,
                                trailing: null,
                              ))
                              : ListTile(
                                leading: dialogItems[i].avatar,
                                title: Row(
                                  children: [
                                    Text(
                                      dialogItems[i].name!,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
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
                          .map(
                            (item) =>
                                getServiceOrNull(item.uid ?? item.service!.uid),
                          )
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

typedef ItemServiceManagerProps =
    ({Service service, VoidCallback? onTap, Widget? trailing});
// ignore: non_constant_identifier_names
final ItemServiceManager = defineWidget((ItemServiceManagerProps props) {
  final service = props.service;

  return (ctx) => ListTile(
    onTap: props.onTap,
    leading: AvatarService(service, radius: 10.0),
    title: Row(
      children: [
        Text(service.name, overflow: TextOverflow.ellipsis, maxLines: 1),
        if (service.writeWith != 'dart') ...[
          const SizedBox(width: 6),
          getLangIcon(ctx, service.writeWith)!,
        ],
      ],
    ),
    subtitle: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            if (service.init.version != null)
              Text('v${service.init.version} ').fontSize(12),
            if (service.init.language != null)
              Text(
                ' ${NaturalLanguage.codeShortMap[service.init.language!.toUpperCase()]?.name ?? service.init.language}',
                style: TextStyle(
                  fontSize: 12,
                  color: Theme.of(ctx).textTheme.bodySmall?.color,
                ),
              ),
          ],
        ),
        Text(service.baseUrl).fontSize(12),

        // if (service.description != null)
        //   Text(
        //     service.description!,
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
    trailing:
        props.trailing ?? const Iconify(Ic.sharp_drag_indicator, size: 20),
  );
});
