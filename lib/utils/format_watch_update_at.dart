import 'package:intl/intl.dart';

String formatWatchUpdatedAt(DateTime date, String? locale) {
  final now = DateTime.now();

  final Map<String, Map<String, String>> translations = {
    'vi': {
      'today': 'Hôm nay',
      'yesterday': 'Hôm qua',
      'twoDaysAgo': 'Hôm kia',
      'format': "dd 'thg' M",
    },
    'en': {
      'today': 'Today',
      'yesterday': 'Yesterday',
      'twoDaysAgo': 'The day before yesterday',
      'format': "MMM dd",
    },
    'ja': {
      'today': '今日',
      'yesterday': '昨日',
      'twoDaysAgo': '一昨日',
      'format': "M月dd日",
    },
    'zn': {
      'today': '今天',
      'yesterday': '昨天',
      'twoDaysAgo': '前天',
      'format': "M月dd日",
    },
  };

  final lang = translations[locale] ?? translations['en']!;

  if (now.year == date.year && now.month == date.month) {
    switch (now.difference(date).inDays) {
      case 0:
        return lang['today']!;
      case 1:
        return lang['yesterday']!;
      case 2:
        return lang['twoDaysAgo']!;
    }
  }

  return DateFormat(lang['format']).format(date);
}
