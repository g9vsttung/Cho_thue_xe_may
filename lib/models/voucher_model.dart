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
      required this.discount});

  factory Voucher.jsonFrom(Map<String, dynamic> json) {
    return Voucher(
        name: json['voucher']['name'],
        id: json['id'],
        date: DateTime.parse(json['expiredDate']),
        timeUsingRemain: json['timeUsingRemain'].toInt(),
        description: json['voucher']['discription'],
        discount: json['voucher']['discountPercent']);
  }
}
