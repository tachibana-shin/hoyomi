import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoyomi/apis/show_snack_bar.dart';
import 'package:hoyomi/constraints/x_platform.dart';
import 'package:hoyomi/controller/general_settings_controller.dart';
import 'package:hoyomi/database/scheme/general_settings.dart';
import 'package:dio/dio.dart';
import 'package:flutter_package_installer/flutter_package_installer.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:hoyomi/plugins/logger.dart';
import 'package:hoyomi/widgets/export.dart';
import 'package:kaeru/kaeru.dart';
import 'package:markdown/markdown.dart' as markdown;
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';

/// Class representing the release object.
class Release {
  final String url;
  final String assetsUrl;
  final String uploadUrl;
  final String htmlUrl;
  final int id;
  final Author author;
  final String nodeId;
  final String tagName;
  final String targetCommitish;
  final String name;
  final bool draft;
  final bool prerelease;
  final DateTime createdAt;
  final DateTime publishedAt;
  final List<Asset> assets;
  final String tarballUrl;
  final String zipballUrl;
  final String body;

  Release({
    required this.url,
    required this.assetsUrl,
    required this.uploadUrl,
    required this.htmlUrl,
    required this.id,
    required this.author,
    required this.nodeId,
    required this.tagName,
    required this.targetCommitish,
    required this.name,
    required this.draft,
    required this.prerelease,
    required this.createdAt,
    required this.publishedAt,
    required this.assets,
    required this.tarballUrl,
    required this.zipballUrl,
    required this.body,
  });

  /// Factory constructor to create a Release instance from a JSON map.
  factory Release.fromJson(Map<String, dynamic> json) {
    return Release(
      url: json['url'],
      assetsUrl: json['assets_url'],
      uploadUrl: json['upload_url'],
      htmlUrl: json['html_url'],
      id: json['id'],
      author: Author.fromJson(json['author']),
      nodeId: json['node_id'],
      tagName: json['tag_name'],
      targetCommitish: json['target_commitish'],
      name: json['name'],
      draft: json['draft'],
      prerelease: json['prerelease'],
      createdAt: DateTime.parse(json['created_at']),
      publishedAt: DateTime.parse(json['published_at']),
      assets: (json['assets'] as List)
          .map((assetJson) => Asset.fromJson(assetJson))
          .toList(),
      tarballUrl: json['tarball_url'],
      zipballUrl: json['zipball_url'],
      body: json['body'],
    );
  }
}

/// Class representing the asset object.
class Asset {
  final String url;
  final int id;
  final String nodeId;
  final String name;
  final String label;
  final Author uploader;
  final String contentType;
  final String state;
  final int size;
  final int downloadCount;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String browserDownloadUrl;

  Asset({
    required this.url,
    required this.id,
    required this.nodeId,
    required this.name,
    required this.label,
    required this.uploader,
    required this.contentType,
    required this.state,
    required this.size,
    required this.downloadCount,
    required this.createdAt,
    required this.updatedAt,
    required this.browserDownloadUrl,
  });

  /// Factory constructor to create an Asset instance from a JSON map.
  factory Asset.fromJson(Map<String, dynamic> json) {
    return Asset(
      url: json['url'],
      id: json['id'],
      nodeId: json['node_id'],
      name: json['name'],
      label: json['label'] ?? "",
      uploader: Author.fromJson(json['uploader']),
      contentType: json['content_type'],
      state: json['state'],
      size: json['size'],
      downloadCount: json['download_count'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      browserDownloadUrl: json['browser_download_url'],
    );
  }
}

/// Class representing the author or uploader.
class Author {
  final String login;
  final int id;
  final String nodeId;
  final String avatarUrl;
  final String gravatarId;
  final String url;
  final String htmlUrl;
  // You can add more fields if needed

  Author({
    required this.login,
    required this.id,
    required this.nodeId,
    required this.avatarUrl,
    required this.gravatarId,
    required this.url,
    required this.htmlUrl,
  });

  /// Factory constructor to create an Author instance from a JSON map.
  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(
      login: json['login'],
      id: json['id'],
      nodeId: json['node_id'],
      avatarUrl: json['avatar_url'],
      gravatarId: json['gravatar_id'] ?? "",
      url: json['url'],
      htmlUrl: json['html_url'],
    );
  }
}

/// Example function to parse JSON string into a list of Release objects.
List<Release> parseReleases(List<dynamic> json) {
  return json.map((json) => Release.fromJson(json)).toList();
}

class UpdateAvailableController {
  static final String apiUrl =
      'https://api.github.com/repos/tachibana-shin/hoyomi/releases';
  static final Duration expiresCheckUpdate = Duration(hours: 3);

  static final UpdateAvailableController _instance =
      UpdateAvailableController._internal();
  static UpdateAvailableController get instance => _instance;

  bool initialized = false;

  UpdateAvailableController._internal();

  void init(BuildContext context, [bool force = false]) async {
    initialized = true;
    if (!context.mounted) return;

    if (!force && await _checkPauseUpdate()) return;

    try {
      final releases = await _getReleases();
      if (!context.mounted) return;

      final packageInfo = await PackageInfo.fromPlatform();

      if (XPlatform.isAndroid) {
        // app-arm64-v8a-release
        // app-armeabi-v7a-release
        // app-x86_64-release
        final versionInfo = Platform.version.toLowerCase();

        late final String arch;
        if (versionInfo.contains('arm64')) {
          arch = 'arm64-v8a';
        }
        // Check for 32-bit ARM architecture
        else if (versionInfo.contains('arm')) {
          arch = 'armeabi-v7a';
        }
        // Check for 64-bit x86 architecture
        else if (versionInfo.contains('x64')) {
          arch = 'x86_64';
        }

        final release = _findReleaseLatest(
          releases,
          contentType: 'application/vnd.android.package-archive',
          arch: arch,
        );
        if (release != null &&
            context.mounted &&
            release.tagName.substring(1, release.tagName.indexOf('_')) !=
                packageInfo.version) {
          showUpdateDialog(context, release);
        } else {
          if (force) showSnackBar(Text('No update available'));
          _pauseUpdate();
        }
      } else if (XPlatform.isIOS) {
        final release = _findReleaseLatest(
          releases,
          contentType: 'application/octet-stream',
        );
        if (release != null &&
            context.mounted &&
            release.tagName.substring(1, release.tagName.indexOf('_')) !=
                packageInfo.version) {
          showUpdateDialog(context, release);
        } else {
          if (force) showSnackBar(Text('No update available'));
          _pauseUpdate();
        }
      } else {
        logger.i('[update_available]: Not support this platform');
      }
    } catch (err) {
      showSnackBar(Text('Error: $err'));
    }
  }

  void _pauseUpdate() async {
    await GeneralSettingsController.instance.save(
      (settings) => settings.copyWith(lastCheckUpdateApp: DateTime.now()),
    );
  }

  Future<bool> _checkPauseUpdate() async {
    final settings =
        await GeneralSettingsController.instance.get() ?? GeneralSettings();

    final time = settings.lastCheckUpdateApp;
    if (time == null) return false;

    return time.add(expiresCheckUpdate).second > DateTime.now().second;
  }

  Future<List<Release>> _getReleases() async {
    final response = await Dio().fetch(RequestOptions(path: apiUrl));

    if (response.statusCode == 200) {
      final releases = parseReleases(response.data);
      return releases;
    } else {
      throw Exception('Failed to load releases');
    }
  }

  Release? _findReleaseLatest(
    List<Release> releases, {
    required String contentType,
    String? arch,
  }) {
    return releases.firstWhereOrNull((release) {
      if (release.prerelease) return false;

      for (final asset in release.assets) {
        if (asset.contentType == contentType &&
            (arch == null ? true : asset.name.contains(arch))) {
          return true;
        }
      }

      return false;
    });
  }

  Future<File> _downloadRelease(
    Release release,
    void Function(double progress) onProgress,
  ) async {
    // Find the Android APK asset
    final asset = release.assets.firstWhere(
      (asset) => asset.contentType == 'application/vnd.android.package-archive',
      orElse: () => throw Exception('No Android package found in the release'),
    );

    final uri = asset.browserDownloadUrl;

    final tempDir = await getTemporaryDirectory();
    final updateDir = Directory('${tempDir.path}/update');
    if (!await updateDir.exists()) {
      await updateDir.create(recursive: true);
    }

    final filePath = '${updateDir.path}/${asset.name}';

    final dio = Dio();

    try {
      final response = await dio.download(
        uri,
        filePath,
        onReceiveProgress: (received, total) {
          if (total != -1) {
            onProgress(received / total);
          }
        },
        options: Options(
          responseType: ResponseType.bytes,
          followRedirects: true,
          validateStatus: (status) => status != null && status < 500,
        ),
      );

      if (response.statusCode != 200) {
        throw Exception(
          "Failed to download file, status: ${response.statusCode}",
        );
      }

      logger.i('Download completed: $filePath');
      onProgress(1.0);
      return File(filePath);
    } catch (e) {
      final file = File(filePath);
      if (await file.exists()) {
        await file.delete();
      }
      showSnackBar(Text("Error during file download: $e"));
      rethrow;
    }
  }

  Future<void> _installApk(File file) async {
    await PackageInstaller().installFromFile(file);
    await file.delete();
  }

  // Suggested code may be subject to a license. Learn more: ~LicenseLog:852242762.
  Future<void> showUpdateDialog(BuildContext context, Release release) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return KaeruBuilder(
          builder: (state) {
            final downloading = state.ref(false);
            final downloadingProgress = state.ref(0.0);
            final downloaded = state.ref(false);
            final installing = state.ref(false);

            return AlertDialog(
              title: Text('Update Available'),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 0.0,
                vertical: 8.0,
              ),
              content: Watch(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (downloading.value || downloaded.value)
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 24.0,
                          vertical: 4.0,
                        ),
                        child: LinearProgressIndicator(
                          value: downloadingProgress.value,
                        ),
                      ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 24.0,
                        vertical: 4.0,
                      ).copyWith(bottom: 2.0),
                      child: Text(
                        'Change log (${release.tagName})',
                        style: TextStyle(fontSize: 17.0),
                      ),
                    ),
                    SizedBox(height: 4.0),
                    SingleChildScrollView(
                      padding: EdgeInsets.only(right: 18.0),
                      child: HtmlWidget(
                        markdown.markdownToHtml(release.body),
                        textStyle: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    SizedBox(height: 8.0),
                  ],
                ),
              ),
              scrollable: true,
              actions: <Widget>[
                OutlinedButton(
                  child: Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                Watch(
                  () => Disabled(
                    disabled: downloading.value,
                    child: FilledButton(
                      child: Text(installing.value ? 'Installing' : 'Download'),
                      onPressed: () async {
                        if (XPlatform.isAndroid) {
                          downloading.value = true;

                          final file = await _downloadRelease(release, (
                            progress,
                          ) {
                            downloadingProgress.value = progress;
                          });

                          downloading.value = false;
                          downloaded.value = true;
                          installing.value = true;

                          await _installApk(file);

                          installing.value = false;
                        } else if (XPlatform.isIOS) {
                          await launchUrl(Uri.parse(release.htmlUrl));
                        }
                      },
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
}
