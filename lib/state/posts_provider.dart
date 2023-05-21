import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hispanosmobile/datasources/rest_api_datasources.dart';
import 'package:hispanosmobile/models/post.dart';
import 'package:hispanosmobile/state/categories_provider.dart';

final postsProvider = StateNotifierProvider<PostStateNotifier, List<Post>?>(
    (ref) => PostStateNotifier(ref));

class PostStateNotifier extends StateNotifier<List<Post>?> {
  PostStateNotifier(this.ref) : super(null) {
    initialize();
  }
  final Ref ref;

  void initialize() async {
    final categories = ref.watch(categoryProvider);
    if (categories == null) return;
    try {
      final datasource = RestApiDataSource();
      final futures =
          categories.map((e) => datasource.getPostsByCategory(e.id));
      final response = await Future.wait(futures);
      state = response
          .expand((i) => i)
          .toList()
          .map((e) => Post.fromJson(e))
          .toList();
    } catch (e) {
      //
    }
  }
}
