class Podcast {
  final int trackId;
  final String? trackName;
  final String? artistName;
  final String? artworkUrl600;
  final int? trackCount;
  final String? feedUrl;

  Podcast({
    required this.trackId,
    this.trackName,
    this.artistName,
    this.artworkUrl600,
    this.feedUrl,
    this.trackCount,
  });

  factory Podcast.fromJSON(Map<String, dynamic> json) {
    return Podcast(
      trackId: json["trackId"],
      trackName: json["trackName"] ?? "",
      artistName: json["artistName"] ?? "",
      artworkUrl600: json["artworkUrl600"] ?? "",
      trackCount: json["trackCount"] ?? "",
      feedUrl: json["feedUrl"] ?? "",
    );
  }

  // 🔹 Helper method
  static List<Podcast> fromJsonList(List<dynamic> list) {
    return list.map((item) => Podcast.fromJSON(item)).toList();
  }
}
