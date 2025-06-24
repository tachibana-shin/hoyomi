String normalizePluginUrl(String inputUrl) {
  final trimmed = inputUrl.trim();

  if (trimmed.contains('raw.githubusercontent.com')) return trimmed;

  final uri = Uri.tryParse(trimmed);
  if (uri == null) return trimmed;

  if (uri.host == 'github.com') {
    final segments = uri.pathSegments;
    if (segments.length >= 2) {
      final user = segments[0];
      final repo = segments[1];

      return 'https://raw.githubusercontent.com/$user/$repo/refs/heads/release/index.js';
    }
  }

  return trimmed;
}
