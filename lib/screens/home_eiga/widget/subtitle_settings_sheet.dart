import 'package:flutter/material.dart';
import 'package:hoyomi/database/scheme/subtitle_settings.dart';
import 'package:hoyomi/controller/subtitle_settings_controller.dart';

class SubtitleSettingsSheet extends StatefulWidget {
  final double height;

  const SubtitleSettingsSheet({super.key, required this.height});

  @override
  State<SubtitleSettingsSheet> createState() => _SubtitleSettingsSheetState();
}

class _SubtitleSettingsSheetState extends State<SubtitleSettingsSheet> {
  String? selectedGroup;
  late SubtitleSettings _settings;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final loaded = await SubtitleSettingsController.instance.get();
    setState(() {
      _settings = loaded ?? const SubtitleSettings();
      _loading = false;
    });
  }

  Future<void> _updateSetting(String key, String value) async {
    setState(() {
      _settings = SubtitleSettings.fromJson(_settings.toJson()..[key] = value);
      selectedGroup = null;
    });
    await SubtitleSettingsController.instance.save(_settings);
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Padding(
        padding: EdgeInsets.all(24),
        child: Center(child: CircularProgressIndicator()),
      );
    }

    final settingsMap = _settings.toJson();

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        top: 16,
        left: 16,
        right: 16,
      ),
      child: SizedBox(
        // constraints: BoxConstraints(
        // maxHeight: 50.h(context),
        // ),
        height: widget.height,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 16),
            Expanded(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child:
                    selectedGroup == null
                        ? SingleChildScrollView(
                          key: const ValueKey('main'),
                          child: Column(
                            children:
                                subtitleOptions.keys
                                    .map(
                                      (key) => ListTile(
                                        dense: true,
                                        visualDensity: VisualDensity.compact,
                                        title: Text(
                                          _formatLabel(key),
                                          style: TextStyle(
                                            color:
                                                Theme.of(
                                                  context,
                                                ).colorScheme.onSurface,
                                          ),
                                        ),
                                        trailing: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              settingsMap[key]!,
                                              style: TextStyle(
                                                color:
                                                    Theme.of(context)
                                                        .colorScheme
                                                        .onSurfaceVariant,
                                              ),
                                            ),
                                            Icon(
                                              Icons.chevron_right,
                                              color:
                                                  Theme.of(
                                                    context,
                                                  ).iconTheme.color,
                                            ),
                                          ],
                                        ),
                                        onTap:
                                            () => setState(
                                              () => selectedGroup = key,
                                            ),
                                      ),
                                    )
                                    .toList(),
                          ),
                        )
                        : Column(
                          key: const ValueKey('submenu'),
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              leading: Icon(
                                Icons.arrow_back,
                                color: Theme.of(context).iconTheme.color,
                              ),
                              title: Text(_formatLabel(selectedGroup!)),
                              onTap: () => setState(() => selectedGroup = null),
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                  children:
                                      subtitleOptions[selectedGroup!]!
                                          .map(
                                            (option) => ListTile(
                                              dense: true,
                                              visualDensity:
                                                  VisualDensity.compact,
                                              title: Text(option),
                                              trailing:
                                                  settingsMap[selectedGroup!] ==
                                                          option
                                                      ? const Icon(Icons.check)
                                                      : null,
                                              onTap:
                                                  () => _updateSetting(
                                                    selectedGroup!,
                                                    option,
                                                  ),
                                            ),
                                          )
                                          .toList(),
                                ),
                              ),
                            ),
                          ],
                        ),
              ),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  String _formatLabel(String key) {
    switch (key) {
      case 'fontFamily':
        return 'Font Family';
      case 'fontColor':
        return 'Font Color';
      case 'fontSize':
        return 'Font Size';
      case 'fontOpacity':
        return 'Font Opacity';
      case 'bgColor':
        return 'Background Color';
      case 'bgOpacity':
        return 'Background Opacity';
      case 'windowColor':
        return 'Window Color';
      case 'windowOpacity':
        return 'Window Opacity';
      case 'edgeStyle':
        return 'Edge Style';
      default:
        return key
            .replaceAllMapped(
              RegExp(r'([a-z])([A-Z])'),
              (m) => '${m[1]} ${m[2]}',
            )
            .trim()
            .split(' ')
            .map((word) => word[0].toUpperCase() + word.substring(1))
            .join(' ');
    }
  }
}
