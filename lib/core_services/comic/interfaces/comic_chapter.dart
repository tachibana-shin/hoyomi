class ComicChapter {
  final String name;
  final String? fullName;
  final String chapterId;
  final DateTime? time;

  const ComicChapter({required this.name, required this.chapterId, this.time, this.fullName});

  factory ComicChapter.createFakeData() {
    return ComicChapter(
      name: "Chapter 1: The Beginning",
      chapterId: "ch1",
      time: DateTime.now().subtract(Duration(days: 2)),
    );
  }

  // Convert from JSON
  factory ComicChapter.fromJson(Map<String, dynamic> json) {
    return ComicChapter(
      name: json['name'],
      chapterId: json['chapterId'],
      time: json['time'] != null ? DateTime.parse(json['time']) : null,
    );
  }

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'chapterId': chapterId,
      'time': time?.toIso8601String(),
    };
  }
}
