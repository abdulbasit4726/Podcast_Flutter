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
            largeTitle: Text('Search'),
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
          SliverToBoxAdapter(child: SizedBox(height: 100)), // 👈 Spacer
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
          leadingSize: 70,
          leading: Align(
            alignment: Alignment.topCenter,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                podcast.artworkUrl600 ?? "",
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                podcast.trackName ?? "",
                maxLines: 2,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 4),
              Text(
                podcast.artistName ?? "",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 4),
            ],
          ),
          subtitle: Text("${podcast.trackCount ?? 0} Episodes"),
        );
      }, childCount: _podcasts.length),
    );
  }
}
