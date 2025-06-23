import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hoyomi/core_services/comic/ab_comic_service.dart';
import 'package:hoyomi/core_services/eiga/ab_eiga_service.dart';
import 'package:hoyomi/core_services/main.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hoyomi/apis/show_snack_bar.dart';

import 'create_js_service.dart';

final Dio _dio = Dio();

Future<void> installJsServiceFromUrl(String url) async {
  try {
    final response = await _dio.get<String>(url);

    final jsCode = response.data;
    if (jsCode == null || jsCode.trim().isEmpty) {
      throw Exception('Empty JS content from $url');
    }

    final service = await createJsService(jsCode);

    final supportDir = await getApplicationSupportDirectory();

    late final String subDir;
    late final String uid;

    if (service is ABEigaService) {
      uid = service.uid;
      subDir = 'eiga';
      allEigaServices[uid] = service;
      eigaServices.value = [...eigaServices.value, service];
    } else if (service is ABComicService) {
      uid = service.uid;
      subDir = 'comic';
      comicServices.value = [...comicServices.value, service];
    } else {
      throw Exception('Unsupported service type');
    }

    final saveDir = Directory('${supportDir.path}/$subDir');
    if (!await saveDir.exists()) {
      await saveDir.create(recursive: true);
    }

    final file = File('${saveDir.path}/$uid.js');
    await file.writeAsString(jsCode);

    showSnackBar(Text('✅ Installed service "$uid" from URL'));
  } catch (e, st) {
    debugPrintStack(label: 'installJsServiceFromUrl', stackTrace: st);
    showSnackBar(Text('❌ Failed to install JS service: $e'));
  }
}
