import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hoyomi/core_services/comic/export.dart';
import 'package:hoyomi/core_services/eiga/export.dart';
import 'package:hoyomi/core_services/js_core/fetch_and_create_js_service.dart';
import 'package:hoyomi/plugins/export.dart';
import 'package:hoyomi/router/index.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sealed_languages/sealed_languages.dart';
import 'package:text_field_validation/text_field_validation.dart';

Future<bool> installJsService(Service service, String jsCode) async {
  final supportDir = await getApplicationSupportDirectory();
  final uid = service.uid;
  late final String subDir;
  bool alreadyExists;

  if (service is ABEigaService) {
    subDir = 'eiga';
    allEigaServices[uid]?.dispose();
    allEigaServices[uid] = service;

    final updated = [
      for (final s in eigaServices.value)
        if (s.uid == uid) service else s,
    ];
    if (!updated.contains(service)) updated.add(service);
    eigaServices.value = updated;
  } else if (service is ABComicService) {
    subDir = 'comic';
    allComicServices[uid]?.dispose();
    allComicServices[uid] = service;

    final updated = [
      for (final s in comicServices.value)
        if (s.uid == uid) service else s,
    ];
    if (!updated.contains(service)) updated.add(service);
    comicServices.value = updated;
  } else {
    throw Exception('Unsupported service type');
  }

  final file = File('${supportDir.path}/$subDir/$uid.js');
  alreadyExists = await file.exists();

  await file.create(recursive: true);
  await file.writeAsString(jsCode);

  return alreadyExists;
}

Future<void> showInstallJsServiceModal(BuildContext? context, [String? url]) async {
  final controller = TextEditingController(text: url ?? 'https://');
  final formKey = GlobalKey<FormState>();

  String? error;
  bool isLoading = false;
  Service? service;
  String? jsCode;
  bool? alreadyExists;

  await showDialog(
    context: context ?? rootNavigatorKey.currentContext!,
    barrierDismissible: false,
    builder: (ctx) {
      return StatefulBuilder(
        builder: (ctx, setState) {
          Future<void> onInstallPressed() async {
            if (!(formKey.currentState?.validate() ?? false)) return;

            setState(() {
              isLoading = true;
              error = null;
              service = null;
              alreadyExists = null;
            });

            try {
              final (createdService, code) = await fetchAndCreateJsService(
                controller.text,
              );
              jsCode = code;
              service = createdService;

              final supportDir = await getApplicationSupportDirectory();
              final uid = service!.uid;
              final subDir = switch (service) {
                ABEigaService _ => 'eiga',
                ABComicService _ => 'comic',
                _ => throw Exception('Unsupported service type'),
              };

              final file = File('${supportDir.path}/$subDir/$uid.js');
              alreadyExists = await file.exists();
            } catch (e) {
              service?.dispose();
              error = 'Failed to fetch or parse plugin: $e';
            }

            setState(() {
              isLoading = false;
            });
          }

          Future<void> confirmAndInstall() async {
            final ok = await installJsService(service!, jsCode!);
            if (!ctx.mounted) return;

            Navigator.of(ctx).pop();
            ScaffoldMessenger.of(context ?? rootNavigatorKey.currentContext!).showSnackBar(
              SnackBar(
                content: Text(
                  '${ok ? "Updated" : "Installed"} plugin "${service!.uid}"',
                ),
              ),
            );
          }

          return AlertDialog(
            title: const Text('Install JS Plugin'),
            content: SizedBox(
              width: 400,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: switch (isLoading) {
                  true => const Center(child: CircularProgressIndicator()),
                  _ => switch (error != null) {
                    true => Text(
                      error!,
                      style: const TextStyle(color: Colors.red),
                    ),
                    _ => switch (service == null) {
                      true => Form(
                        key: formKey,
                        child: TextFormField(
                          controller: controller,
                          autofocus: true,
                          decoration: const InputDecoration(
                            labelText: 'Plugin URL',
                            hintText:
                                'https://example.com/plugin.js or GitHub URL',
                          ),
                          keyboardType: TextInputType.url,
                          validator: TextFieldValidation.url,
                        ),
                      ),
                      _ => Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              AvatarService(service!, radius: 24),
                              const SizedBox(width: 8),
                              Text(
                                service!.init.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text('UID: ${service!.uid}'),
                          if (service!.init.version case final v?)
                            Text('Version: $v'),
                          Text('Base URL: ${service!.init.rootUrl}'),
                          if (service!.init.language case final lang?) ...[
                            Text(
                              'Language: ${NaturalLanguage.codeShortMap[lang.toUpperCase()]?.name ?? lang.toUpperCase()}',
                            ),
                          ],
                          if (service!.init.description case final desc?) ...[
                            const SizedBox(height: 8),
                            Text(desc),
                          ],
                          const SizedBox(height: 8),
                          Text(
                            alreadyExists!
                                ? 'This plugin is already installed. Proceed to update?'
                                : 'Ready to install this plugin.',
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    },
                  },
                },
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  service?.dispose();
                  Navigator.of(ctx).pop();
                },
                child: const Text('Cancel'),
              ),
              if (!isLoading)
                ElevatedButton(
                  onPressed: () {
                    if (service == null) {
                      onInstallPressed();
                    } else {
                      confirmAndInstall();
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                      Theme.of(ctx).colorScheme.primary,
                    ),
                  ),
                  child: Text(
                    service == null
                        ? 'Next'
                        : alreadyExists == true
                        ? 'Update'
                        : 'Install',
                    style: TextStyle(
                      color: Theme.of(ctx).colorScheme.onPrimary,
                    ),
                  ),
                ),
            ],
          );
        },
      );
    },
  );
}

/// Update existing JS plugin by UID.
/// This will fetch the latest plugin JS from its rootUrl and overwrite the local file.
Future<void> updateJsServiceByUid(String uid) async {
  final supportDir = await getApplicationSupportDirectory();
  final Service? oldService = allEigaServices[uid] ?? allComicServices[uid];

  final subDir = switch (oldService) {
    ABEigaService _ => 'eiga',
    ABComicService _ => 'comic',
    _ => throw Exception('Unsupported service type'),
  };

  final fileJs = File('${supportDir.path}/$subDir/$uid.js');
  if (!await fileJs.exists()) {
    throw Exception('Service "$uid" not found in installed services');
  }

  // install_url save in fileJs with format @install_url = <url>
  final installUrl = await fileJs.readAsString().then((content) {
    final match = RegExp(r'// @install_url\s*=\s*(.+)').firstMatch(content);
    return match?.group(1)?.trim();
  });

  if (installUrl == null || installUrl.isEmpty) {
    throw Exception('Service "$uid" does not have a valid install URL');
  }

  final (newService, jsCode) = await fetchAndCreateJsService(installUrl);

  if (newService.uid != uid) {
    throw Exception(
      'Plugin UID mismatch: expected "$uid", got "${newService.uid}"',
    );
  }

  await installJsService(newService, jsCode);
}
