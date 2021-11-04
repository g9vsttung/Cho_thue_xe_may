class Voucher {
  DateTime date;
  int timeUsingRemain;
  String description;
  int discount;
  String id;
  int? pointExchange;
  String name;

  Voucher(
      {required this.name,
      required this.id,
      required this.date,
      required this.timeUsingRemain,
      required this.description,
      required this.discount,
      int? pointExchange}) {
    if (pointExchange != null) {
      this.pointExchange = pointExchange;
    }
  }

  factory Voucher.jsonFrom(Map<String, dynamic> json) {
    return Voucher(
        name: json['voucher']['name'],
        id: json['id'],
        date: DateTime.parse(json['expiredDate']),
        timeUsingRemain: json['timeUsingRemain'].toInt(),
        description: json['voucher']['description'],
        discount: json['voucher']['discountPercent']);
  }

  factory Voucher.jsonFromExchange(Map<String, dynamic> json) {
    return Voucher(
        name: json['name'],
        id: json['id'],
        date: DateTime.parse(json['expiredDate']),
        timeUsingRemain: json['timeUsingRemain'] ?? 0.toInt(),
        description: json['description'],
        pointExchange: json["pointExchange"],
        discount: json['discountPercent']);
  }
}
