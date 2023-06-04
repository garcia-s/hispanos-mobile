class Magazine {
  final String title;
  final String shareUrl;
  // final String content;

  Magazine.fromJson(Map<String, dynamic> map)
      : title = map["title"],
        shareUrl = map["url"];
  // content = map["content"]["rendered"];
}
