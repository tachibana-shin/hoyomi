class SourceContent {
  final String content;
  final Uri url;
  final Map<String, String> headers;

  const SourceContent(
      {required this.content, required this.url, this.headers = const {}});
}
