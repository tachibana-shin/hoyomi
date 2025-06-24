import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hoyomi/logic/normalize_plugin_url.dart';
import 'package:sealed_languages/sealed_languages.dart';
import 'package:text_field_validation/text_field_validation.dart';
import 'package:hoyomi/core_services/js_core/create_js_service.dart';
import 'package:hoyomi/core_services/eiga/ab_eiga_service.dart';
import 'package:hoyomi/core_services/comic/ab_comic_service.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hoyomi/core_services/main.dart';

final Dio _dio = Dio();

Future<void> showInstallJsServiceModal(BuildContext context) async {
  final controller = TextEditingController();
  final formKey = GlobalKey<FormState>();

  String? error;
  bool isLoading = false;
  Service? service;
  String? jsCode;
  bool? alreadyExists;

  await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (ctx) {
      return StatefulBuilder(
        builder: (ctx, setState) {
          Future<void> onInstallPressed() async {
            if (!(formKey.currentState?.validate() ?? false)) return;

            final url = normalizePluginUrl(controller.text.trim());
            setState(() {
              isLoading = true;
              error = null;
              service = null;
              alreadyExists = null;
            });

            try {
              final response = await _dio.get<String>(url);
              jsCode = response.data;
              if (jsCode == null || jsCode!.trim().isEmpty) {
                throw Exception('Empty JS content from $url');
              }

              service = await createJsService(jsCode!);

              final supportDir = await getApplicationSupportDirectory();
              final uid = service!.uid;
              late final String subDir;

              if (service is ABEigaService) {
                subDir = 'eiga';
              } else if (service is ABComicService) {
                subDir = 'comic';
              } else {
                throw Exception('Unsupported service type');
              }

              final file = File('${supportDir.path}/$subDir/$uid.js');
              alreadyExists = await file.exists();

              setState(() {
                isLoading = false;
              });
            } catch (e) {
              setState(() {
                isLoading = false;
                error = 'Failed to fetch or parse plugin: $e';
              });
            }
          }

          Future<void> confirmAndInstall() async {
            final uid = service!.uid;
            final supportDir = await getApplicationSupportDirectory();
            late final String subDir;

            if (service is ABEigaService) {
              subDir = 'eiga';
              allEigaServices[uid] = service! as ABEigaService;

              final newEigaServices = [
                for (final s in eigaServices.value)
                  if (s.uid == uid) service! as ABEigaService else s,
              ];
              if (!newEigaServices.contains(service)) {
                newEigaServices.add(service as ABEigaService);
              }

              eigaServices.value = newEigaServices;
            } else if (service is ABComicService) {
              subDir = 'comic';
              allComicServices[uid] = service as ABComicService;

              final newComicServices = [
                for (final s in comicServices.value)
                  if (s.uid == uid) service! as ABComicService else s,
              ];
              if (!newComicServices.contains(service)) {
                newComicServices.add(service as ABComicService);
              }

              comicServices.value = newComicServices;
            }

            final file = File('${supportDir.path}/$subDir/$uid.js');
            await file.create(recursive: true);
            await file.writeAsString(jsCode!);

            if (!ctx.mounted) return;

            Navigator.of(ctx).pop(); // close dialog
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  '${alreadyExists! ? "Updated" : "Installed"} plugin "$uid"',
                ),
              ),
            );
          }

          return AlertDialog(
            title: const Text('Install JS Plugin'),
            content: SizedBox(
              width: 400,
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 300),
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
                                'https://example.com/plugin.js or https://github.com/{user}/{repo}',
                          ),
                          keyboardType: TextInputType.url,
                          validator: (value) {
                            return TextFieldValidation.url(value);
                            // final url = value?.trim() ?? '';
                            // if (url.isEmpty) return 'Please enter a URL';
                            // final uri = Uri.tryParse(url);

                            // if (uri == null || !uri.hasAbsolutePath) {
                            //   return 'Invalid URL';
                            // }
                            // if (!url.startsWith('http')) {
                            //   return 'URL must start with http/https';
                            // }
                            // return null;
                          },
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
                          if (service!.init.version != null)
                            Text('Version: ${service!.init.version}'),
                          Text('Base URL: ${service!.init.rootUrl}'),
                          if (service!.init.language != null)
                            Text(
                              'Language: ${NaturalLanguage.codeShortMap[service!.init.language!.toUpperCase()]?.name ?? service!.init.language!.toUpperCase()}',
                            ),

                          if (service!.init.description != null) ...[
                            const SizedBox(height: 8),
                            Text(service!.init.description!),
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
                onPressed: () => Navigator.of(ctx).pop(),
                child: const Text('Cancel'),
              ),
              if (!isLoading)
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                      Theme.of(ctx).colorScheme.primary,
                    ),
                  ),
                  onPressed: () {
                    if (service == null) {
                      onInstallPressed();
                    } else {
                      confirmAndInstall();
                    }
                  },
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
