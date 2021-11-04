import 'package:chothuexemay_mobile/models/bike_model.dart';
import 'package:chothuexemay_mobile/models/booking_model.dart';
import 'package:chothuexemay_mobile/utils/constants.dart';
import 'package:chothuexemay_mobile/views/AppointmentDetail/appointment_detail_view.dart';
import 'package:flutter/material.dart';

class BodyAppointment extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BodyAppointment();
  }
}

class _BodyAppointment extends State<BodyAppointment> {
  String selectedCate = "renting";
  List<Booking> list = [
    Booking(
        id: "1",
        ownerId: "2",
        bikeId: "2",
        dateRent: DateTime.now(),
        dateReturnExpected: DateTime.now(),
        dateReturnActual: DateTime.now(),
        price: 120000,
        paymentId: "paymentId",
        address: "address",
        paymentMethod: "Tiền mặt",
        status: 0,
        bike: Bike(
            id: "1",
            licensePlate: "sdasd",
            color: "Black",
            modelYear: "2020",
            ownerId: "2",
            categoryId: "2",
            status: 1,
            ownerPhone: "ownerPhone",
            ownerName: "ownerName",
            address: "address",
            rating: 5,
            numberOfRating: 42,
            brandName: "brandName",
            categoryName: "Air Blade",
            imgPath:
                "https://lh3.googleusercontent.com/proxy/Fc84KxEhs5Phn5y3GGKfORMAG3TnytNXhQZLINaN5HlQmlHxtDSpyBI8x1idHDhzhcOwY1stSdye7XbeELmhxAn8jfkty5Sx1vQq16aibxwGlFa30e6-DbfnExIWmMZsdP5d")),
    Booking(
        id: "1",
        ownerId: "2",
        bikeId: "2",
        dateRent: DateTime.now(),
        dateReturnExpected: DateTime.now(),
        dateReturnActual: DateTime.now(),
        price: 135000,
        paymentId: "paymentId",
        address: "address",
        paymentMethod: "Paypal",
        status: 1,
        bike: Bike(
            id: "1",
            licensePlate: "sdasd",
            color: "Black",
            modelYear: "2020",
            ownerId: "2",
            categoryId: "2",
            status: 1,
            ownerPhone: "ownerPhone",
            ownerName: "ownerName",
            address: "address",
            rating: 5,
            numberOfRating: 42,
            brandName: "brandName",
            categoryName: "Air Blade",
            imgPath:
                "https://lh3.googleusercontent.com/proxy/Fc84KxEhs5Phn5y3GGKfORMAG3TnytNXhQZLINaN5HlQmlHxtDSpyBI8x1idHDhzhcOwY1stSdye7XbeELmhxAn8jfkty5Sx1vQq16aibxwGlFa30e6-DbfnExIWmMZsdP5d")),
    Booking(
        id: "1",
        ownerId: "2",
        bikeId: "2",
        dateRent: DateTime.now(),
        dateReturnExpected: DateTime.now(),
        dateReturnActual: DateTime.now(),
        price: 135000,
        paymentId: "paymentId",
        address: "address",
        paymentMethod: "Paypal",
        status: 2,
        bike: Bike(
            id: "1",
            licensePlate: "sdasd",
            color: "Black",
            modelYear: "2020",
            ownerId: "2",
            categoryId: "2",
            status: 1,
            ownerPhone: "ownerPhone",
            ownerName: "ownerName",
            address: "address",
            rating: 5,
            numberOfRating: 42,
            brandName: "brandName",
            categoryName: "Air Blade",
            imgPath:
                "https://lh3.googleusercontent.com/proxy/Fc84KxEhs5Phn5y3GGKfORMAG3TnytNXhQZLINaN5HlQmlHxtDSpyBI8x1idHDhzhcOwY1stSdye7XbeELmhxAn8jfkty5Sx1vQq16aibxwGlFa30e6-DbfnExIWmMZsdP5d")),
    Booking(
        id: "1",
        ownerId: "2",
        bikeId: "2",
        dateRent: DateTime.now(),
        dateReturnExpected: DateTime.now(),
        dateReturnActual: DateTime.now(),
        price: 135000,
        paymentId: "paymentId",
        address: "address",
        paymentMethod: "Paypal",
        status: 3,
        bike: Bike(
            id: "1",
            licensePlate: "sdasd",
            color: "Black",
            modelYear: "2020",
            ownerId: "2",
            categoryId: "2",
            status: 1,
            ownerPhone: "ownerPhone",
            ownerName: "ownerName",
            address: "address",
            rating: 5,
            numberOfRating: 42,
            brandName: "brandName",
            categoryName: "Air Blade",
            imgPath:
                "https://lh3.googleusercontent.com/proxy/Fc84KxEhs5Phn5y3GGKfORMAG3TnytNXhQZLINaN5HlQmlHxtDSpyBI8x1idHDhzhcOwY1stSdye7XbeELmhxAn8jfkty5Sx1vQq16aibxwGlFa30e6-DbfnExIWmMZsdP5d")),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 25),
            color: Colors.white,
            child: cateNavBar(),
          ),
          Container(
            padding: EdgeInsets.only(top: 25, bottom: 10),
            child: SingleChildScrollView(child: listAppointmentByCate()),
          )
        ],
      ),
    );
  }

  Widget cateNavBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        //=====================MASSAGE
        if (selectedCate == "renting")
          Container(
              padding: const EdgeInsets.only(
                bottom:
                    2, // This can be the space you need betweeb text and underline
              ),
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                color: ColorConstants.textBold,
                width: 3, // This would be the width of the underline
              ))),
              child: const Text(
                "Đang thuê",
                style: TextStyle(
                  fontSize: 18,
                  color: ColorConstants.textBold,
                  fontWeight: FontWeight.bold,
                  decorationThickness: 4,
                ),
              ))
        else
          GestureDetector(
              onTap: () {
                setState(() {
                  selectedCate = "renting";
                });
              },
              child: const Text(
                "Đang thuê",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              )),

        //=====================FACIAL
        if (selectedCate == "history")
          Container(
              padding: const EdgeInsets.only(
                bottom:
                    2, // This can be the space you need betweeb text and underline
              ),
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                color: ColorConstants.textBold,
                width: 3, // This would be the width of the underline
              ))),
              child: const Text(
                "Lịch sử thuê",
                style: TextStyle(
                    fontSize: 18,
                    color: ColorConstants.textBold,
                    fontWeight: FontWeight.bold,
                    decorationThickness: 4),
              ))
        else
          GestureDetector(
            onTap: () {
              setState(() {
                selectedCate = "history";
              });
            },
            child: const Text("Lịch sử thuê",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                )),
          ),
      ],
    );
  }

  Widget listAppointmentByCate() {
    if (selectedCate == "renting") {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (Booking booking in list)
            if (booking.status == 0 || booking.status == 1)
              rentDetailBox(booking),
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (Booking booking in list)
            if (booking.status == 2 || booking.status == 3)
              rentDetailBox(booking),
        ],
      );
    }
  }

  Widget rentDetailBox(Booking booking) {
    Size size = MediaQuery.of(context).size;
    Color color = Colors.blueAccent;
    String icon = "";
    String status = "";
    if (booking.status == 0) {
      color = Colors.orange;
      icon = "pending.png";
      status = "Chờ nhận xe";
    } else if (booking.status == 1) {
      color = Colors.blueAccent;
      icon = "inProcess.png";
      status = "Đang thuê";
    } else if (booking.status == 2) {
      color = Colors.green;
      icon = "finished.png";
      status = "Hoàn thành";
    } else if (booking.status == 3) {
      color = Colors.red;
      icon = "canceled.png";
      status = "Hủy";
    }
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(mainAxisSize: MainAxisSize.min, children: [
                    Image.asset(
                      StringConstants.iconDirectory + icon,
                      width: 16,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      status,
                      style: TextStyle(fontSize: 16, color: color),
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    if (booking.status == 0 || booking.status == 2)
                      Image.asset(
                        StringConstants.iconDirectory + "point.png",
                        width: 3,
                        color: color,
                      ),
                    SizedBox(
                      width: 7,
                    ),
                    if (booking.status == 0)
                      Text(
                        booking.dateRent.toString().split(" ")[0],
                        style: TextStyle(fontSize: 16, color: color),
                      ),
                    if (booking.status == 2)
                      Text(
                        booking.dateReturnActual.toString().split(" ")[0],
                        style: TextStyle(fontSize: 16, color: color),
                      )
                  ]),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        booking.bike.categoryName,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Image.asset(
                        StringConstants.iconDirectory + "point.png",
                        width: 2,
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Text(
                        booking.bike.modelYear,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Giá: " + booking.price.round().toString() + " đ",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return AppointmentDetailView(booking: booking);
                    },
                  ));
                },
                icon: Image.asset(
                  StringConstants.iconDirectory + "detail.png",
                ),
                iconSize: 30,
              )
            ],
          ),
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
