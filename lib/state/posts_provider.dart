import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hispanosmobile/datasources/rest_api_datasources.dart';
import 'package:hispanosmobile/models/app_category.dart';
import 'package:hispanosmobile/models/post.dart';
import 'package:hispanosmobile/state/categories_provider.dart';

final postsProvider =
    StateNotifierProvider<PostStateNotifier, List<Post>?>((ref) {
  final instance = PostStateNotifier(ref);
  final categories = ref.watch(categoryProvider);
  if (categories != null) instance.initialize(categories);
  return instance;
});

class PostStateNotifier extends StateNotifier<List<Post>?> {
  PostStateNotifier(this.ref) : super(null);
  final Ref ref;

  void initialize(List<AppCategory> categories) async {
    final ids = categories.map((e) => (e.id)).toList();
    final datasource = RestApiDataSource();
    final postsMap = await datasource.getPostsByCategory(categories: ids);
    state = postsMap.map((e) => Post.fromJson(e)).toList();
  }
}
