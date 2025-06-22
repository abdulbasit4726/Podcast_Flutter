import 'package:flutter/cupertino.dart';
import 'package:podcast_flutter/API/api_service.dart';

import '../models/podcast.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  SearchScreenState createState() => SearchScreenState();
}

class SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Podcast> _podcasts = [];

  @override
  Widget build(BuildContext context) {
    return _buildCupertinoPage();
  }

  void handleSearch(String searchText) async {
    final podcasts = await fetchPodcasts(searchText);
    // print("Podcasts ${podcasts}");
    setState(() {
      _podcasts = podcasts.results;
    });
  }

  // iOS UI
  Widget _buildCupertinoPage() {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            largeTitle: Text('My Items'),
            stretch: true,
            backgroundColor: CupertinoColors.systemGroupedBackground,
            bottomMode: NavigationBarBottomMode.always,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(60),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: CupertinoSearchTextField(
                  controller: _searchController,
                  placeholder: 'Search...',
                  onChanged: handleSearch,
                ),
              ),
            ),
          ),
          SearchList(podcasts: _podcasts),
        ],
      ),
    );
  }
}

class SearchList extends StatelessWidget {
  const SearchList({super.key, required List<Podcast> podcasts})
    : _podcasts = podcasts;

  final List<Podcast> _podcasts;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        final podcast = _podcasts[index];
        return CupertinoListTile(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          leadingSize: 50,
          leading: Image.asset("assets/images/appicon.png", fit: BoxFit.cover),
          title: Text(podcast.trackName ?? ""),
          subtitle: Text(podcast.artistName ?? ""),
        );
      }, childCount: _podcasts.length),
    );
  }
}
