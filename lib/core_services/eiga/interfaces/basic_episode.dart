class BasicEpisode {
  final String name;
  final String episodeId;
  final DateTime? time;

  const BasicEpisode({required this.name, required this.episodeId, this.time});

  factory BasicEpisode.createFakeData() {
    return BasicEpisode(
      name: 'episode name',
      episodeId: 'episode id',
      time: DateTime.now(),
    );
  }
}
