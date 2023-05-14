class AppCategory {
  late final int id;
  late final String name;
  late final String slug;

  AppCategory.fromJson(Map<String, dynamic> map) {
    id = map["id"];
    name = map["name"];
    slug = map["slug"];
  }
}
