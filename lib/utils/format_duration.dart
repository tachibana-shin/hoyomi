String formatDuration(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, '0');
  final hours = twoDigits(duration.inHours);
  final minutes = twoDigits(duration.inMinutes.remainder(60));
  final seconds = twoDigits(duration.inSeconds.remainder(60));
  return [if (duration.inHours > 0) hours, minutes, seconds].join(':');
}

// String formatDuration(Duration duration) {
//   final hours = duration.inHours;
//   final minutes = duration.inMinutes.remainder(60);
//   final seconds = duration.inSeconds.remainder(60);
//
//   final formattedDuration = hours > 0
//       ? '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}'
//       : '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
//
//   return formattedDuration;
// }
