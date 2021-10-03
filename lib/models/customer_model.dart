class Customer {
  String id;
  String phoneNumber;
  String identityNumber;
  String fullname;
  String identityImg;
  int rewardPoints;
  bool isBanned;
  int banCount;

  factory Customer.jsonFrom(Map<String, dynamic> json) {
    return Customer(
        id: json['id'],
        phoneNumber: json['phoneNumber'],
        identityNumber: json['identityNumber'],
        fullname: json['fullname'],
        identityImg: json['identityImg'],
        rewardPoints: json['rewardPoints'],
        isBanned: json['isBanned'],
        banCount: json['banCount']);
  }

  //Constructor
  Customer({
    required this.id,
    required this.phoneNumber,
    required this.identityNumber,
    required this.fullname,
    required this.identityImg,
    required this.rewardPoints,
    required this.isBanned,
    required this.banCount,
  });
}
