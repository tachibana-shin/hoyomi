String formatNumber(num number) {
  if (number >= 1e9) {
    return '${(number / 1e9).toStringAsFixed(1)}B';
  } else if (number >= 1e6) {
    return '${(number / 1e6).toStringAsFixed(1)}M';
  } else if (number >= 1e3) {
    return '${(number / 1e3).toStringAsFixed(1)}K';
  } else {
    return number.toString();
  }
}
