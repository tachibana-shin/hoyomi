class SourceVideo {
  final String src;
  final String type;
  final Map<String, String> headers;

  SourceVideo({
    required this.src,
    required this.type,
    this.headers = const {}
  });
}