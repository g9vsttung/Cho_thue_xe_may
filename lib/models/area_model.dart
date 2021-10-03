class Area {
  String id;
  String name;
  String postalCode;

  factory Area.jsonFrom(Map<String, dynamic> json) {
    return Area(
      id: json['id'],
      name: json['name'],
      postalCode: json['postalCode'],
    );
  }

  //Constructors
  Area({required this.id, required this.name, required this.postalCode});
}
