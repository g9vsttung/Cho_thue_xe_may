
class Customer {
  String id;
  String name;
  String phone;
  Customer({required this.id,required this.name,required this.phone});
  factory Customer.jsonFrom(Map<String,dynamic> json){
    return Customer(
      id:json['id'],
      name: json['name'],
      phone: json['postalCode'],
    );
  }
}