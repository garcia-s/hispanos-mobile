import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'dart:convert';

const String urlBase = 'hispanosemprendedores.com';
const String apiPath = "wp-json/wp/v2";

class RestApiDataSource {
  RestApiDataSource();

  final List<String> _categoryFields = [
    "id",
    "date",
    "slug",
    "link",
    "title",
    "content",
    "author",
    "featured_media",
    "featured_image_src",
    "author_data"
  ];

  ///
  /// Gets all the post for a group of categories
  ///
  Future<List<Map<String, dynamic>>> getPostsByCategory({
    required List<int> categories,
    int? offset,
  }) async {
    final Uri url =
        Uri.https(urlBase, '$apiPath/posts').replace(queryParameters: {
      "per_page": "20",
      "categories": categories.join(','),
      "_fields": _categoryFields.join(','),
    });
    final response = await http.Client().get(url);
    if (response.statusCode != 200) throw UnespectedResponseCode();
    return _jsonToList(response.body);
  }

  ///
  /// Gets all the categories for the posts
  ///
  Future<List<Map<String, dynamic>>> getBlogCategories() async {
    final Uri url = Uri.https(urlBase, '$apiPath/categories').replace(
      queryParameters: {
        "_fields": ["id", "name", "slug", "parent"].join(","),
        "orderby": "id",
        "per_page": "100",
      },
    );

    final response = await http.Client().get(url);
    if (response.statusCode != 200) throw UnespectedResponseCode();
    return _jsonToList(response.body);
  }

  ///
  /// Transform json to a List of objects
  ///
  List<Map<String, dynamic>> _jsonToList(String string) =>
      (json.decode(string) as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList();

  Future<Uint8List> getImageData(Uri url) async {
    final response = await http.get(url);
    return response.bodyBytes;
  }
}

class UnespectedResponseCode extends Error {}
