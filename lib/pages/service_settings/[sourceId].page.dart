import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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

  @override
  void initState() {
    _service = getService(widget.sourceId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.pop();
          },
        ),
        title: Text('Settings service ${_service.name}'),
      ),
      body: const Center(
        child: Text(
          'SourceIdPagePage is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
