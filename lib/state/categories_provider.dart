import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hispanosmobile/datasources/rest_api_datasources.dart';
import 'package:hispanosmobile/models/app_category.dart';

final categoryProvider =
    StateNotifierProvider<CategoryStateNotifier, List<AppCategory>?>(
        (ref) => CategoryStateNotifier(ref));

class CategoryStateNotifier extends StateNotifier<List<AppCategory>?> {
  final Ref ref;
  CategoryStateNotifier(this.ref) : super(null);

  initialize() async {
    final datasource = RestApiDataSource();
    final json = await datasource.getBlogCategories();
    final categories = json.map((e) => AppCategory.fromJson(e)).toList();
    state = categories;
  }
}
