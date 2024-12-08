import 'package:event_bus/event_bus.dart';

EventBus eventBus = EventBus();

class UpdatedHistory {
  final String bookId;
  final String chapterId;
  final bool force;

  const UpdatedHistory(
      {required this.bookId, required this.chapterId, this.force = false});
}
