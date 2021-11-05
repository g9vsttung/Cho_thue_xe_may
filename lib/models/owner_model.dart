import 'package:chothuexemay_mobile/models/bike_model.dart';

class Owner {
  String id;
  String phoneNumber;
  String fullname;
  String address;
  int status;
  int banTimes;
  String adminId;
  String areaId;
  String mail;
  int numberOfbikes;
  double rating;
  int numberOfRatings;
  List<Bike> bikes;
  Bike bike;
  factory Owner.jsonFrom(Map<String, dynamic> json) {
    return Owner(
        id: json["id"],
        phoneNumber: json['phoneNumber'] ?? "",
        fullname: json['fullname'] ?? "Unknow",
        address: json['address'] ?? "Unknow",
        numberOfbikes: json['numberOfBikes'] ?? 0,
        rating: json['rating'].toDouble() ?? 0,
        numberOfRatings: json['numberOfRatings'] ?? 0,
        adminId: json['adminId'] ?? "Unknow",
        areaId: json['areaId'] ?? "Unknow",
        banTimes: json['banTimes'] ?? 0,
        mail: json['mail'] ?? "Unknow",
        status: json['status'] ?? 0,
        bike: json['bike'] == null ? Bike.empty() : Bike.jsonFrom(json['bike']),
        bikes: (json['listBike'] == null
            ? []
            : (json['listBike'] as List)
                .map((e) => Bike.jsonFrom(e))
                .toList()));
  }

  //Constructor
  Owner(
      {required this.id,
      required this.phoneNumber,
      required this.fullname,
      required this.address,
      required this.numberOfbikes,
      required this.rating,
      required this.numberOfRatings,
      required this.areaId,
      required this.status,
      required this.adminId,
      required this.banTimes,
      required this.mail,
      required this.bikes,
      required this.bike});
}
