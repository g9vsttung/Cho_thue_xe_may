import 'package:chothuexemay_mobile/models/booking_transaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class BodyAppointmentDetail extends StatefulWidget {
  BookingTranstion booking;

  BodyAppointmentDetail({required this.booking});

  @override
  State<BodyAppointmentDetail> createState() => _BodyAppointmentDetail();
}

class _BodyAppointmentDetail extends State<BodyAppointmentDetail> {
  //Format currency number
  RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  String Function(Match) mathFunc = (Match match) => '${match[1]}.';

  @override
  Widget build(BuildContext context) {
    //_customerViewModel.booking(widget.dateRent, widget.dateReturn);
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 25, left: 15, right: 15),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Text(
                        "THÔNG TIN",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Ngày thuê:",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        Text(
                            widget.booking.dateRentActual
                                .toString()
                                .split(" ")[0],
                            style: TextStyle(
                              fontSize: 18,
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Ngày trả:",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        Text(
                            widget.booking.dateReturnActual
                                .toString()
                                .split(" ")[0],
                            style: TextStyle(
                              fontSize: 18,
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Loại xe:",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        Text(widget.booking.bike.brandName,
                            style: TextStyle(
                              fontSize: 18,
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Tên khách hàng: ",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        Text("",
                            style: TextStyle(
                              fontSize: 18,
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Số điện thoại: ",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        Text(widget.booking.ownerPhone!,
                            style: TextStyle(
                              fontSize: 18,
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    const Text("Địa chỉ của bạn:",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(widget.booking.address,
                        style: const TextStyle(
                          fontSize: 18,
                        )),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Phương thức thanh toán: ",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        Text("widget.booking.paymentMethod",
                            style: TextStyle(
                              fontSize: 18,
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Trạng thái: ",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        Text(
                            widget.booking.status == 0
                                ? "Chờ nhận xe"
                                : "Đang thuê",
                            style: TextStyle(
                              fontSize: 18,
                            ))
                      ],
                    ),
                  ],
                )),
            const SizedBox(
              height: 15,
            ),
            Container(
              color: Colors.grey[300],
              padding:
                  EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Tổng cộng",
                          style: TextStyle(
                            fontSize: 18,
                          )),
                      Text(
                          widget.booking.price
                                  .round()
                                  .toString()
                                  .replaceAllMapped(reg, mathFunc) +
                              ' đ',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
