class Report {
  String id;
  bool? isReport;
  String? content;
  Report({required this.id, required this.content, this.isReport = false});
  Report.submit({required this.id, required this.content});
  factory Report.jsonFrom(Map<String, dynamic> json) {
    return Report(id: json['id'], content: json['content']);
  }
}
