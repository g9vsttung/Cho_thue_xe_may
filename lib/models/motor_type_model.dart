class MotorType {
  String id;
  String name;
  MotorType({required this.id, required this.name});
  factory MotorType.jsonFrom(Map<String, dynamic> json) {
    return MotorType(id: json['id'], name: json['name']);
  }
}
