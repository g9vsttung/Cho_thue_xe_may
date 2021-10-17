import 'package:chothuexemay_mobile/models/price_model.dart';
import 'package:chothuexemay_mobile/utils/constants.dart';
import 'package:chothuexemay_mobile/views/Booking/Voucher/voucher_view.dart';
import 'package:chothuexemay_mobile/views/Booking/Waiting/waiting_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

class BodyBookingDetail extends StatefulWidget {
  String dateRent;
  String dateReturn;
  PriceDataTable cateBike;

  BodyBookingDetail(
      {required this.dateRent,
      required this.dateReturn,
      required this.cateBike});

  @override
  State<BodyBookingDetail> createState() => _BodyBookingDetailState();
}

class _BodyBookingDetailState extends State<BodyBookingDetail> {
  String selectedMethod = "Tiền mặt";
  int totalPrice = 130;
  List<String> listPayMethod = ["Tiền mặt", "Momo", "Visa"];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
              padding: EdgeInsets.only(top: 25, left: 15, right: 15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      "XÁC NHẬN THÔNG TIN",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Container(
                        width: size.width * 0.4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("Ngày thuê:",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: 15,
                            ),
                            Text("Ngày trả:",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: 15,
                            ),
                            Text("Loại xe:",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.dateRent,
                                style: TextStyle(
                                  fontSize: 18,
                                )),
                            SizedBox(
                              height: 15,
                            ),
                            Text(widget.dateReturn,
                                style: TextStyle(
                                  fontSize: 18,
                                )),
                            SizedBox(
                              height: 15,
                            ),
                            Text(widget.cateBike.bikeType,
                                style: TextStyle(
                                  fontSize: 18,
                                )),
                            SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  const Text("Địa chỉ của bạn:",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 15,
                  ),
                  Text("Địa chỉ ng dùng",
                      style: TextStyle(
                        fontSize: 18,
                      )),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        hintText: "Địa chỉ cụ thể ( không bắt buộc )"),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              )),
          Container(
            width: double.infinity,
            color: Colors.grey[300],
            padding: EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 10),
            child: Text("Phương thức thanh toán",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      StringConstants.iconDirectory + "price.png",
                      width: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    dropDownPayMethod(size)
                  ],
                ),
                Text(
                  "|",
                  style: TextStyle(fontSize: 18),
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return VoucherView();
                      },));
                    },
                    child: Text(
                      "Thêm ưu đãi",
                      style: TextStyle(fontSize: 18),
                    ))
              ],
            ),
          ),
          Container(
            color: Colors.grey[300],
            padding: EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Tổng cộng",
                        style: TextStyle(
                          fontSize: 18,
                        )),
                    Text(totalPrice.toString() + ".000 đ",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    RaisedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return WaitingView();
                          },
                        ));
                      },
                      color: Colors.orange,
                      child: Text(
                        "Xác nhận",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 35,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget dropDownPayMethod(Size size) {
    return DropdownButton(
        underline: const SizedBox(),
        value: selectedMethod,
        onChanged: (String? x) {
          setState(() {
            selectedMethod = x!;
          });
        },
        iconSize: 12,
        icon: Image.asset(
          "assets/icons/dropDown.png",
          color: Colors.grey,
          width: 10,
        ),
        items: listPayMethod.map((String method) {
          return DropdownMenuItem(
              value: method,
              child: SizedBox(
                width: size.width * 0.35,
                child: Text(
                  method,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ));
        }).toList());
  }
}
