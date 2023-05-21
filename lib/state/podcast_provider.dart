import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hispanosmobile/datasources/rest_api_datasources.dart';
import 'package:hispanosmobile/models/podcast.dart';

final podcastProvider =
    StateNotifierProvider<PodcastStateNotifier, List<Podcast>?>(
        (ref) => PodcastStateNotifier(ref));

class PodcastStateNotifier extends StateNotifier<List<Podcast>?> {
  final Ref ref;

  PodcastStateNotifier(this.ref) : super(null) {
    initialize();
  }

  initialize() async {
    final datasource = RestApiDataSource();
    final response = await datasource.getPostsByCategory(194);
    state = response.map((e) => Podcast.fromJson(e)).toList();
  }
}
