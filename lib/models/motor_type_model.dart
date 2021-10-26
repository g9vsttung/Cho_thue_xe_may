class MotorType {
  String id;
  String name;
  int price;
  String? img;
  MotorType({required this.id, required this.name, required this.price});
  factory MotorType.jsonFrom(Map<String, dynamic> json) {
    return MotorType(
        id: json['motorTypeId'],
        name: json['typeName'],
        price: json['price'].toInt() ?? 0);
  }
}
