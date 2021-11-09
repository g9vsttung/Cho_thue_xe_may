class Report {
  String id;

  String? content;
  Report({required this.id, required this.content});
  factory Report.jsonFrom(Map<String, dynamic> json) {
    return Report(id: json['id'], content: json['content']);
  }
}
