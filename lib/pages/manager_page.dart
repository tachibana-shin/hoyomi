import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:hoyomi/apis/show_snack_bar.dart';
import 'package:hoyomi/constraints/x_platform.dart';

import 'package:hoyomi/core_services/main.dart';
import 'package:hoyomi/core_services/service.dart';
import 'package:hoyomi/utils/authentication.dart';
import 'package:hoyomi/widgets/export.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:kaeru/kaeru.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../controller/update_available.dart';

class ManagerPage extends StatelessWidget {
  const ManagerPage({super.key});

  Widget _buildAccountMain() {
    return _AccountMainTile();
  }

  Future<String> _getInfoDevice() async {
    final deviceInfoPlugin = DeviceInfoPlugin();
    String info = "";

    if (XPlatform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
      info =
          "Android ${androidInfo.version.release} (${androidInfo.version.codename})\n"
          "${androidInfo.model} Build/${androidInfo.version.incremental}";
    } else if (XPlatform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfoPlugin.iosInfo;
      info =
          "iOS ${iosInfo.systemVersion}\n${iosInfo.utsname.machine} (${iosInfo.name})";
    } else if (XPlatform.isWindows) {
      WindowsDeviceInfo windowsInfo = await deviceInfoPlugin.windowsInfo;
      info =
          "Windows ${windowsInfo.productName} (Build ${windowsInfo.buildNumber})";
    } else if (XPlatform.isMacOS) {
      MacOsDeviceInfo macInfo = await deviceInfoPlugin.macOsInfo;
      info = "macOS ${macInfo.osRelease} (${macInfo.model})";
    } else if (XPlatform.isLinux) {
      LinuxDeviceInfo linuxInfo = await deviceInfoPlugin.linuxInfo;
      info = "Linux ${linuxInfo.name} ${linuxInfo.version}";
    } else {
      info = "Unknown OS";
    }

    return info;
  }

  Widget _buildWidgetMain(BuildContext context) {
    return ListView(
      children: [
        _buildAccountMain(),

        const Divider(),

        const ListTile(title: Text('Comic services')),
        Watch(
          () => DynamicHeightGridView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            // padding: const EdgeInsets.all(8.0),
            // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 0.0,
            mainAxisSpacing: 10.0,
            //   childAspectRatio: 1/3,
            // ),
            itemCount: comicServices.value.length,
            builder: (context, index) {
              return _buildCard(comicServices.value[index]);
            },
          ),
        ),

        const SizedBox(height: 15.0),

        const ListTile(title: Text('Eiga services')),
        Watch(
          () => DynamicHeightGridView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            // padding: const EdgeInsets.all(8.0),
            // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 0.0,
            mainAxisSpacing: 10.0,
            //   childAspectRatio: 1/3,
            // ),
            itemCount: eigaServices.value.length,
            builder: (context, index) {
              return _buildCard(eigaServices.value[index]);
            },
          ),
        ),

        const Divider(),

        /// OS button
        FutureBuilder(
          future: _getInfoDevice(),
          builder: (context, snapshot) {
            if (snapshot.data == null) return SizedBox.shrink();

            final osInfo = snapshot.data!;
            IconData osIcon = Icons.device_unknown;

            if (XPlatform.isAndroid) {
              osIcon = Icons.android;
            } else if (XPlatform.isIOS) {
              osIcon = Icons.apple;
            } else if (XPlatform.isWindows) {
              osIcon = Icons.laptop_windows;
            } else if (XPlatform.isMacOS) {
              osIcon = Icons.laptop_mac;
            } else if (XPlatform.isLinux) {
              osIcon = Icons.laptop;
            }

            return ListTile(
              leading: Icon(osIcon),
              title: const Text("Operating System"),
              subtitle: Text(osInfo),
            );
          },
        ),

        /// Check update button
        ListTile(
          leading: Iconify(Ic.round_security_update),
          title: const Text('Check Update'),
          onTap: () {
            UpdateAvailableController.instance.init(context, true);
          },
        ),

        /// License button
        ListTile(
          leading: const Icon(Icons.code_rounded),
          title: const Text('License'),
          onTap: () async {
            final packageInfo = await PackageInfo.fromPlatform();
            if (!context.mounted) return;

            showLicensePage(
              context: context,
              applicationName: packageInfo.appName,
              applicationVersion: packageInfo.version,
              applicationLegalese: '© ${DateTime.now().year} Tachibana Shin',
              useRootNavigator: true,
            );
          },
        ),

        /// About button
        ListTile(
          leading: const Icon(Icons.info_outline),
          title: const Text('About'),
          onTap: () async {
            final packageInfo = await PackageInfo.fromPlatform();
            if (!context.mounted) return;

            showAboutDialog(
              context: context,
              applicationName: packageInfo.appName,
              applicationVersion: packageInfo.version,
              applicationLegalese: '© ${DateTime.now().year} Tachibana Shin',
              useRootNavigator: true,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Text(
                    'This app opensource manga reading and anime viewing application for free',
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          /// icon toggle theme
          ValueListenableBuilder(
            valueListenable: AdaptiveTheme.of(context).modeChangeNotifier,
            builder: (_, mode, child) {
              return IconButton(
                icon: Icon(
                  {
                    AdaptiveThemeMode.light: Icons.light_mode_rounded,
                    AdaptiveThemeMode.dark: Icons.dark_mode_rounded,
                    AdaptiveThemeMode.system: Icons.brightness_auto,
                  }[mode],
                ),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      var selectedMode = AdaptiveTheme.of(context).mode;

                      return StatefulBuilder(
                        builder: (context, setState) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: AdaptiveThemeMode.values.map((mode) {
                              final icon = {
                                AdaptiveThemeMode.light:
                                    Icons.light_mode_rounded,
                                AdaptiveThemeMode.dark: Icons.dark_mode_rounded,
                                AdaptiveThemeMode.system: Icons.brightness_auto,
                              }[mode];

                              final label = {
                                AdaptiveThemeMode.light: 'Light Theme',
                                AdaptiveThemeMode.dark: 'Dark Theme',
                                AdaptiveThemeMode.system: 'System Default',
                              }[mode];

                              return RadioListTile<AdaptiveThemeMode>(
                                value: mode,
                                groupValue: selectedMode,
                                onChanged: (value) {
                                  if (value != null) {
                                    setState(() => selectedMode = value);

                                    switch (value) {
                                      case AdaptiveThemeMode.dark:
                                        AdaptiveTheme.of(context).setDark();
                                        break;
                                      case AdaptiveThemeMode.light:
                                        AdaptiveTheme.of(context).setLight();
                                        break;
                                      case AdaptiveThemeMode.system:
                                        AdaptiveTheme.of(context).setSystem();
                                    }
                                    Navigator.pop(context);
                                  }
                                },
                                title: Text(label!),
                                secondary: Icon(icon),
                              );
                            }).toList(),
                          );
                        },
                      );
                    },
                  );
                },
              );
            },
          ),

          /// icon search
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),

          /// icon settings
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: PullRefreshPage(
        onLoadData: () async {
          return false;
        },
        onLoadFake: () => true,
        builder: (loading, _) => _buildWidgetMain(context),
      ),
    );
  }

  Widget _buildCard(Service service) {
    return AccountService(
      key: ValueKey(DateTime.now().millisecond.toString()),
      service: service,
    );
  }
}

/// ============ utils ===============
class _AccountMainTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        final user = snapshot.data;

        return ListTile(
          leading: GestureDetector(
            onTap: user?.photoURL != null
                ? () => _showAvatarDialog(context, user!.photoURL!)
                : null,
            child: CircleAvatar(
              radius: 24,
              backgroundColor: Colors.grey.shade300,
              backgroundImage: user?.photoURL != null
                  ? CachedNetworkImageProvider(user!.photoURL!)
                  : null,
              child: user?.photoURL == null
                  ? Text(
                      (user?.displayName ?? 'U').substring(0, 1).toUpperCase(),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    )
                  : null,
            ),
          ),
          title: Text(
            user?.displayName ?? 'Guest',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(user?.email ?? 'No email'),
          onTap: user != null
              ? () => _showUserMenu(context, user)
              : () => context.push('/sign_in/main'),
        );
      },
    );
  }

  void _showAvatarDialog(BuildContext context, String imageUrl) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: InteractiveViewer(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showUserMenu(BuildContext context, User? user) async {
    String? idToken;

    if (kDebugMode && user != null) {
      final tokenResult = await user.getIdTokenResult();
      idToken = tokenResult.token;
    }

    if (!context.mounted) return;

    showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: user?.photoURL != null
                  ? CachedNetworkImageProvider(user!.photoURL!)
                  : null,
              child: user?.photoURL == null
                  ? Text(
                      (user?.displayName ?? 'U').substring(0, 1).toUpperCase(),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : null,
            ),
            title: Text(user?.displayName ?? 'Guest'),
            subtitle: Text(user?.email ?? 'No email'),
          ),
          if (kDebugMode && idToken != null) ...[
            ListTile(
              title: Text(
                'Token:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                idToken,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 12, fontFamily: 'monospace'),
              ),
              trailing: IconButton(
                icon: Icon(Icons.copy),
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: idToken!));
                  showSnackBar(Text('Copied to clipboard!'));
                },
              ),
            ),
          ],
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Sign Out'),
            onTap: () async {
              await Authentication.instance.signOut();
              if (context.mounted) context.pop();
            },
          ),
        ],
      ),
    );
  }
}
