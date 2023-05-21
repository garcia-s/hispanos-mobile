import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hispanosmobile/datasources/rest_api_datasources.dart';
import 'package:hispanosmobile/models/magazine.dart';

final magazineProvider =
    StateNotifierProvider<MagazineStateNotifier, List<Magazine>?>(
        (ref) => MagazineStateNotifier(ref));

class MagazineStateNotifier extends StateNotifier<List<Magazine>?> {
  final Ref ref;

  MagazineStateNotifier(this.ref) : super(null) {
    initialize();
  }

  initialize() async {
    final datasource = RestApiDataSource();
    final response = await datasource.getPostsByCategory(194);
    state = response.map((e) => Magazine.fromJson(e)).toList();
  }
}
