import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hoyomi/apis/show_snack_bar.dart';
import 'package:hoyomi/core_services/interfaces/setting/field_input.dart';
import 'package:hoyomi/core_services/interfaces/setting/setting_field.dart';
import 'package:hoyomi/core_services/main.dart';
import 'package:hoyomi/core_services/service.dart';

class ServiceSettingsPage extends StatefulWidget {
  final String sourceId;

  const ServiceSettingsPage({super.key, required this.sourceId});

  @override
  State<ServiceSettingsPage> createState() => _ServiceSettingsPageState();
}

class _ServiceSettingsPageState extends State<ServiceSettingsPage> {
  late final Service _service;

  final Map<String, String> _settingsChanged = {};

  @override
  void initState() {
    _service = getService(widget.sourceId);
    super.initState();
  }

  void _save() async {
    for (final key in _settingsChanged.keys) {
      await _service.setSetting(key, _settingsChanged[key]!);
    }

    if (_settingsChanged.containsKey('cookie')) {
      /// Update user cache
      await _service.onAfterSignIn(cookie: _settingsChanged['cookie'] ?? '');
    }

    _settingsChanged.clear();
    showSnackBar(Text('Settings saved'));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        title: Text('Settings for ${_service.name}'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _settingsChanged.isEmpty ? null : _save,
            color: _settingsChanged.isEmpty ? Colors.grey : null,
          ),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'General settings',
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondaryFixedDim,
            ),
          ),
        ),
        for (final field in Service.settingsDefault) _buildSettingField(field),
        if (_service.init.settings != null) Divider(),
        if (_service.init.settings != null)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Service settings',
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondaryFixedDim,
              ),
            ),
          ),
        if (_service.init.settings != null)
          for (final field in _service.init.settings!)
            _buildSettingField(field),
      ],
    );
  }

  Widget _buildSettingField(SettingField field) {
    if (field is FieldInput) {
      return ListTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(field.name, maxLines: 1, overflow: TextOverflow.ellipsis),
            TextFormField(
              decoration: InputDecoration(
                hintText: field.placeholder,
                border: OutlineInputBorder(),
              ),
              initialValue: _settingsChanged[field.key] ??
                  _service.getSetting(key: field.key) ??
                  field.defaultFn(_service),
              maxLines: field.maxLines,
              onFieldSubmitted: (value) => _onChangedValue(field, value),
              onChanged: (value) => _onChangedValue(field, value),
            ),
          ],
        ),
        subtitle: field.description != null ? Text(field.description!) : null,
      );
    }

    throw Exception('Unsupported field type: ${field.runtimeType}');
  }

  void _onChangedValue(SettingField field, String value) {
    final oldValue = _service.getSetting(key: field.key) ??
        (field is FieldInput ? field.defaultFn(_service) : null);

    if (oldValue != value && _settingsChanged[field.key] != value) {
      _settingsChanged[field.key] = value;
      setState(() {});
    } else if (_settingsChanged.containsKey(field.key)) {
      _settingsChanged.remove(field.key);
      setState(() {});
    }
  }
}
