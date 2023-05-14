import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hispanosmobile/datasources/rest_api_datasources.dart';
import 'package:hispanosmobile/models/magazine.dart';
import 'package:hispanosmobile/models/podcast.dart';
import 'package:hispanosmobile/models/post.dart';
import 'package:hispanosmobile/models/app_category.dart';

final appStateProvider =
    StateNotifierProvider<AppStateNotifierProvider, AppState>(
        (ref) => AppStateNotifierProvider(ref));

class AppStateNotifierProvider extends StateNotifier<AppState> {
  final Ref ref;
  AppStateNotifierProvider(this.ref) : super(AppState());

  initialize() async {
    try {
      final datasource = RestApiDataSource();
      final categoryMap = await datasource.getBlogCategories();
      final List<AppCategory> categories = [];
      final List<int> categoryIDs = [];
      for (int i = 0; i < categoryMap.length; i++) {
        categories.add(AppCategory.fromJson(categoryMap[i]));
        categoryIDs.add(categoryMap[i]["id"]);
      }
      final postMap =
          await datasource.getPostsByCategory(categories: categoryIDs);
      final posts = postMap.map((e) => Post.fromJson(e)).toList();
      final podcastMap = await datasource.getPostsByCategory(categories: [194]);
      final podcasts = podcastMap.map((e) => Podcast.fromJson(e)).toList();
      state.categories = categories;
      state.posts = posts;
      state.podcasts = podcasts;
      state = state.clone();
    } catch (e) {
      // NO
    }
  }
}

class AppState {
  List<Post>? posts;
  List<AppCategory>? categories;
  List<Podcast>? podcasts;
  List<Magazine>? magazine;

  AppState();

  AppState._clone(
      {required this.posts,
      required this.categories,
      required this.podcasts,
      required this.magazine});

  AppState clone() => AppState._clone(
        posts: posts,
        categories: categories,
        podcasts: podcasts,
        magazine: magazine,
      );
}
