import './podcast.dart';

class SearchResult {
  final int resultCount;
  final List<Podcast> results;

  SearchResult({required this.resultCount, required this.results});

  factory SearchResult.fromJSON(Map<String, dynamic> json) {
    return SearchResult(
      resultCount: json["resultCount"],
      results: Podcast.fromJsonList(json["results"]),
    );
  }
}
