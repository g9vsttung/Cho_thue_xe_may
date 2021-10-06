class Owner {
  String id;
  String phoneNumber;
  String identityNumber;
  String fullname;
  String address;
  String identityImg;
  int status;
  int banTimes;
  String adminId;
  String areaId;
  String mail;
  int numberOfbikes;
  double rating;
  int numberOfRatings;

  factory Owner.jsonFrom(Map<String, dynamic> json) {
    return Owner(
        id: json['id'],
        phoneNumber: json['phoneNumber'],
        identityNumber: json['identityNumber'] ?? "Unknow",
        fullname: json['fullname'],
        address: json['address'] ?? "Unknow",
        numberOfbikes: json['numberOfBikes'] ?? 0,
        identityImg: json['identityImg'] ?? "Unknow",
        rating: json['rating'] ?? 0,
        numberOfRatings: json['numberOfRatings'] ?? 0,
        adminId: json['adminId'] ?? "Unknow",
        areaId: json['areaId'] ?? "Unknow",
        banTimes: json['banTimes'] ?? 0,
        mail: json['mail'] ?? "Unknow",
        status: json['status'] ?? 0);
  }

  //Constructor
  Owner(
      {required this.id,
      required this.phoneNumber,
      required this.identityNumber,
      required this.fullname,
      required this.address,
      required this.numberOfbikes,
      required this.identityImg,
      required this.rating,
      required this.numberOfRatings,
      required this.areaId,
      required this.status,
      required this.adminId,
      required this.banTimes,
      required this.mail});
}
