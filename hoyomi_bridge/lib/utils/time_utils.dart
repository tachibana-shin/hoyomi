import 'package:eval_annotation/eval_annotation.dart';
import 'package:intl/intl.dart';

@Bind()
abstract class TimeUtils {
  static DateTime convertTimeAgoToUtc(String timeAgo) {
    final now = DateTime.now();
    final regex = RegExp(r'(\d+)\s+(.+)\s+');
    final match = regex.firstMatch(timeAgo.toLowerCase());

    if (match == null) {
      throw Exception("Can't parse time ago string '${timeAgo.toLowerCase()}'");
    }

    final amount = int.parse(match.group(1)!);
    final unit = match.group(2)!;

    Duration duration;

    switch (unit) {
      case 'giây':
        duration = Duration(seconds: amount);
        break;
      case 'phút':
        duration = Duration(minutes: amount);
        break;
      case 'giờ':
        duration = Duration(hours: amount);
        break;
      case 'ngày':
        duration = Duration(days: amount);
        break;
      case 'tuần':
        duration = Duration(days: amount * 7);
        break;
      case 'tháng':
        final newDate = now.subtract(Duration(days: amount * 30));
        return newDate.toUtc();
      case 'năm':
        final newDate = now.subtract(Duration(days: amount * 365));
        return newDate.toUtc();
      default:
        throw Exception("Invalid Date");
    }

    final resultTime = now.subtract(duration);

    return resultTime.toUtc();
  }
}
