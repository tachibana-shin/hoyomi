class BasicImage {
  final String src;
  final Map<String, String>? headers;

  BasicImage({required this.src, this.headers});

  // Convert from JSON
  factory BasicImage.fromJson(Map<String, dynamic> json) {
    return BasicImage(
      src: json['src'],
      headers: (json['headers'] as Map<String, dynamic>?)
          ?.map((key, value) => MapEntry(key, value as String)),
    );
  }

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'src': src,
      'headers': headers,
    };
  }
}
