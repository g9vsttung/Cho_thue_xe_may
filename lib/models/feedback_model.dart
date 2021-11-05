class FeedbackModel {
  String? id;
  String? content;
  int? rating;
  bool? isRating;
  FeedbackModel.emptyModel({required this.id, this.isRating = false});

  FeedbackModel(
      {required this.id,
      required this.content,
      required this.rating,
      this.isRating = true});

  factory FeedbackModel.jsonFrom(Map<String, dynamic> json) {
    return FeedbackModel(
      id: json["id"],
      content: json["content"],
      rating: json["rating"],
    );
  }
}
