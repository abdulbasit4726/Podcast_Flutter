class Podcast {
  final int trackId;
  final String? trackName;
  final String? artistName;

  Podcast({required this.trackId, this.trackName, this.artistName});

  factory Podcast.fromJSON(Map<String, dynamic> json) {
    return Podcast(
      trackId: json["trackId"],
      trackName: json["trackName"] ?? "",
      artistName: json["artistName"] ?? "",
    );
  }

  // 🔹 Helper method
  static List<Podcast> fromJsonList(List<dynamic> list) {
    return list.map((item) => Podcast.fromJSON(item)).toList();
  }
}
