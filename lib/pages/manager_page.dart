import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';

import 'package:hoyomi/core_services/main.dart';
import 'package:hoyomi/core_services/service.dart';
import 'package:hoyomi/widgets/manager/account_service.dart';
import 'package:hoyomi/widgets/pull_refresh_page.dart';
import 'package:package_info_plus/package_info_plus.dart';

class ManagerPage extends StatelessWidget {
  const ManagerPage({super.key});

  Future<String> _getInfoDevice() async {
    final deviceInfoPlugin = DeviceInfoPlugin();
    String info = "";

    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
      info =
          "Android ${androidInfo.version.release} (${androidInfo.version.codename})\n"
          "${androidInfo.model} Build/${androidInfo.version.incremental}";
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfoPlugin.iosInfo;
      info =
          "iOS ${iosInfo.systemVersion}\n${iosInfo.utsname.machine} (${iosInfo.name})";
    } else if (Platform.isWindows) {
      WindowsDeviceInfo windowsInfo = await deviceInfoPlugin.windowsInfo;
      info =
          "Windows ${windowsInfo.productName} (Build ${windowsInfo.buildNumber})";
    } else if (Platform.isMacOS) {
      MacOsDeviceInfo macInfo = await deviceInfoPlugin.macOsInfo;
      info = "macOS ${macInfo.osRelease} (${macInfo.model})";
    } else if (Platform.isLinux) {
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
        ListTile(title: const Text('Comic services')),
        DynamicHeightGridView(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          // padding: const EdgeInsets.all(8.0),
          // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 0.0,
          mainAxisSpacing: 10.0,
          //   childAspectRatio: 1/3,
          // ),
          itemCount: comicServices.length,
          builder: (context, index) {
            return _buildCard(comicServices[index]);
          },
        ),

        SizedBox(height: 15.0),

        ListTile(title: const Text('Eiga services')),
        DynamicHeightGridView(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          // padding: const EdgeInsets.all(8.0),
          // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 0.0,
          mainAxisSpacing: 10.0,
          //   childAspectRatio: 1/3,
          // ),
          itemCount: eigaServices.length,
          builder: (context, index) {
            return _buildCard(eigaServices[index]);
          },
        ),

        Divider(),

        /// OS button
        FutureBuilder(
            future: _getInfoDevice(),
            builder: (context, snapshot) {
              if (snapshot.data == null) return SizedBox.shrink();

              final osInfo = snapshot.data!;
              IconData osIcon = Icons.device_unknown;

              if (Platform.isAndroid) {
                osIcon = Icons.android;
              } else if (Platform.isIOS) {
                osIcon = Icons.apple;
              } else if (Platform.isWindows) {
                osIcon = Icons.laptop_windows;
              } else if (Platform.isMacOS) {
                osIcon = Icons.laptop_mac;
              } else if (Platform.isLinux) {
                osIcon = Icons.laptop;
              }

              return ListTile(
                leading: Icon(osIcon),
                title: const Text("Operating System"),
                subtitle: Text(osInfo),
              );
            }),

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
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Accounts manager")),
      body: PullRefreshPage(
          onLoadData: () async {
            return false;
          },
          onLoadFake: () => true,
          builder: (loading, _) => _buildWidgetMain(context)),
    );
  }

  Widget _buildCard(Service service) {
    return AccountService(
      key: ValueKey(DateTime.now().millisecond.toString()),
      service: service,
    );
  }
}
