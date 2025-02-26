import 'package:event_bus/event_bus.dart';

EventBus eventBus = EventBus();

class UpdatedHistory {
  final String comicId;
  final String chapterId;
  final bool force;

  const UpdatedHistory({
    required this.comicId,
    required this.chapterId,
    this.force = false,
  });
}
