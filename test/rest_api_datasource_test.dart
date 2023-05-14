import 'package:flutter_test/flutter_test.dart';
import 'package:hispanosmobile/datasources/rest_api_datasources.dart';

void main() {
  group("Get Posts By Category", () {
    test("Getting the data as it should", () async {
      final api = RestApiDataSource();
      final data = await api.getPostsByCategory(categories: [1, 3, 8, 9]);
      expect(data.length, 20);
    });
  });
}
