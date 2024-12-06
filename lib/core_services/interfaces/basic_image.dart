class BasicImage {
  final String url;
  final String? alt;

  BasicImage({required this.url, this.alt});

  // Convert from JSON
  factory BasicImage.fromJson(Map<String, dynamic> json) {
    return BasicImage(
      url: json['url'],
      alt: json['alt'],
    );
  }

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'alt': alt,
    };
  }
}
