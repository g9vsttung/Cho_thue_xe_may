class Category {
  String id;
  String name;
  Category({required this.id, required this.name});
  factory Category.jsonFrom(Map<String, dynamic> json) {
    return Category(id: json['id'], name: json['name']);
  }
}
