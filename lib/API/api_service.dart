import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/search_result.dart';

Future<SearchResult> fetchPodcasts(String searchText) async {
  final response = await http.get(
    Uri.https('itunes.apple.com', '/search', {
      'term': searchText,
      'media': 'podcast',
    }),
  );
  if (response.statusCode == 200) {
    final jsonBody = json.decode(response.body);
    final podcastResponse = SearchResult.fromJSON(jsonBody);
    return podcastResponse;
  } else {
    throw Exception("Failed to load podcasts");
  }
}
