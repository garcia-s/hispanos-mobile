import 'package:http/http.dart' as http;
import 'dart:convert';

class RestApiDataSource {
  RestApiDataSource();

  final String urlBase = 'hispanosemprendedores.com';
  final String apiPath = "wp-json/wp/v2";

  final List<String> _postFields = [
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
  /// Gets all the categories for the posts
  ///
  Future<List<Map<String, dynamic>>> getBlogCategories() async {
    final Uri url = Uri.https(urlBase, '$apiPath/categories').replace(
      queryParameters: {
        "_fields": ["id", "name", "slug", "parent"].join(","),
        "exclude": "12,14,15,177,194",
        "orderby": "id",
        "per_page": "100",
      },
    );

    final response = await http.Client().get(url);
    if (response.statusCode != 200) throw UnespectedResponseCode();
    return _jsonToList(response.body);
  }

  ///
  /// Gets all the post for a of category
  ///
  Future<List<Map<String, dynamic>>> getPostsByCategory(int id,
      {int amount = 10, int offset = 0}) async {
    final Uri url = Uri.https(urlBase, '$apiPath/posts').replace(
      queryParameters: {
        "categories": id.toString(),
        "_fields": _postFields.join(","),
        "orderby": "date",
        "per_page": amount.toString(),
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
}

class UnespectedResponseCode extends Error {}
