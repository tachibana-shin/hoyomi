import 'package:intl/intl.dart';

String formatWatchUpdatedAt(DateTime date, String? locale) {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final yesterday = today.subtract(Duration(days: 1));
  final twoDaysAgo = today.subtract(Duration(days: 2));

  final Map<String, Map<String, String>> translations = {
    'vi': {
      'today': 'Hôm nay',
      'yesterday': 'Hôm qua',
      'twoDaysAgo': 'Hôm kia',
      'format': "dd 'thg' M"
    },
    'en': {
      'today': 'Today',
      'yesterday': 'Yesterday',
      'twoDaysAgo': 'The day before yesterday',
      'format': "MMM dd"
    },
    'ja': {
      'today': '今日',
      'yesterday': '昨日',
      'twoDaysAgo': '一昨日',
      'format': "M月dd日"
    },
    'zn': {
      'today': '今天',
      'yesterday': '昨天',
      'twoDaysAgo': '前天',
      'format': "M月dd日"
    },
  };

  // Lấy bản dịch tương ứng
  final lang = translations[locale] ?? translations['en']!;

  if (date.isAfter(today)) {
    return lang['today']!;
  } else if (date.isAfter(yesterday)) {
    return lang['yesterday']!;
  } else if (date.isAfter(twoDaysAgo)) {
    return lang['twoDaysAgo']!;
  } else {
    return DateFormat(lang['format']).format(date);
  }
}
