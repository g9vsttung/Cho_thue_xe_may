class FeedbackModel {
  String? id;
  String content;
  int rating;
  String date;
  String? image;
  String? name;

  FeedbackModel(
      {String? id,
      String? image,
      String? name,
      required this.content,
      required this.rating,
      required this.date}) {
    if (id != null) {
      this.id = id;
    }
    if (image != null) {
      this.image = image;
    }
    if (name != null) {
      this.name = name;
    }
  }

  factory FeedbackModel.jsonFrom(Map<String, dynamic> json) {
    return FeedbackModel(
        id: json["id"],
        content: json["content"],
        rating: json["rating"],
        date: json["date"]);
  }
}
