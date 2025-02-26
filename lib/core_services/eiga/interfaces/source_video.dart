class SourceVideo {
  final String src;
  final Uri url;
  final String type;
  final Map<String, String> headers;

  SourceVideo({
    required this.src,
    required this.url,
    required this.type,
    this.headers = const {},
  });
}
