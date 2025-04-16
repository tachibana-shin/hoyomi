import 'package:flutter_volume_controller/flutter_volume_controller.dart';

@override
Future<double?> getVolume() => FlutterVolumeController.getVolume();

@override
Future<void> setVolume(double value) =>
    FlutterVolumeController.setVolume(value);

@override
Future<void> updateShowSystemUI(bool state) =>
    FlutterVolumeController.updateShowSystemUI(state);
