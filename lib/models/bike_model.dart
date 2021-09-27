class Bike {
  String id;
  String ownerId;
  String categoryId;
  String ownerName;
  String address;
  String ownerPhone;
  String licensePlate;
  String color;
  int status;
  String modelYear;
  num rating;
  int numberOfRating;

  factory Bike.jsonFrom(Map<String, dynamic> json) {
    return Bike(
        id: json['id'],
        ownerId: json['ownerId'],
        categoryId: json[''],
        ownerName: json[''],
        address: json[''],
        ownerPhone: json[''],
        licensePlate: json[''],
        color: json[''],
        status: json[''],
        modelYear: json[''],
        rating: json[''],
        numberOfRating: json['']);
  }
  //Constructors
  Bike(
      {required this.id,
      required this.ownerId,
      required this.categoryId,
      required this.ownerName,
      required this.address,
      required this.ownerPhone,
      required this.licensePlate,
      required this.color,
      required this.status,
      required this.modelYear,
      required this.rating,
      required this.numberOfRating});
}
