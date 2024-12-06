class Route {
  final String name;
  final String slug;

  Route({required this.name, required this.slug});

  // Convert from JSON
  factory Route.fromJson(Map<String, dynamic> json) {
    return Route(
      name: json['name'],
      slug: json['slug'],
    );
  }

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'slug': slug,
    };
  }
}
