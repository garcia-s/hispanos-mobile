import 'package:html/dom.dart';
import 'package:html/parser.dart';

class Post {
  late final int id;
  late final DateTime date;
  late final String slug;
  late final String link;
  late final String title;
  late final AuthorData author;
  late final String imageUri;
  late final Document content;

  Post.fromJson(Map<String, dynamic> map) {
    id = map["id"];
    date = DateTime.parse(map["date"]);
    slug = map["slug"];
    link = map["link"];
    title = map["title"]["rendered"];

    content = parse(map["content"]["rendered"]);
    imageUri = map["featured_image_src"];
    author = AuthorData(id: map["author"], name: map["author_data"]["name"]);
  }
}

class AuthorData {
  final int id;
  final String name;

  AuthorData({
    required this.id,
    required this.name,
  });
}
