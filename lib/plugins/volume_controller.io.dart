import 'package:flutter_volume_controller/flutter_volume_controller.dart';

import 'volume_controller_stub.dart';

class VolumeController implements VolumeControllerStub {
  @override
  getVolume() => FlutterVolumeController.getVolume();
  @override
  setVolume(double value) => FlutterVolumeController.setVolume(value);
  @override
  updateShowSystemUI(bool state) =>
      FlutterVolumeController.updateShowSystemUI(state);
}
