class ComicChanges {
  static ComicChanges? _instance;
  // Avoid self instance
  ComicChanges._();
  static ComicChanges get instance => _instance ??= ComicChanges._();
}
