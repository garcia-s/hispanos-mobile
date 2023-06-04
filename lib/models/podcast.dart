class Podcast {
  late final int id;
  late final DateTime date;
  late final String slug;
  late final String link;
  late final String title;
  late final int author;
  late final String? imageUri;
  late final String content;

  Podcast.fromJson(Map<String, dynamic> map) {
    id = map["id"];
    date = DateTime.parse(map["date"]);
    slug = map["slug"];
    link = map["link"];
    title = map["title"]["rendered"];
    author = map["author"];
    content = map["content"]["rendered"];
    imageUri = map["featured_image_src"];
  }
}
