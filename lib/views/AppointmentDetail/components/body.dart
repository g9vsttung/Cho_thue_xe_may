// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:chothuexemay_mobile/models/booking_transaction.dart';
import 'package:chothuexemay_mobile/utils/constants.dart';
import 'package:chothuexemay_mobile/view_model/booking_view_model.dart';
import 'package:chothuexemay_mobile/views/Appointment/appointment_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BodyAppointmentDetail extends StatefulWidget {
  BookingTranstion booking;

  BodyAppointmentDetail({Key? key, required this.booking}) : super(key: key);

  @override
  State<BodyAppointmentDetail> createState() => _BodyAppointmentDetail();
}

class _BodyAppointmentDetail extends State<BodyAppointmentDetail> {
  //Format currency number
  RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  BookingTransactionViewModel _bookingTransactionViewModel =
      BookingTransactionViewModel();

  // ignore: prefer_function_declarations_over_variables
  String Function(Match) mathFunc = (Match match) => '${match[1]}.';

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                        const Text("Ngày thuê:",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        Text(
                            widget.booking.dateRentActual
                                .toString()
                                .substring(0, 16)
                                .replaceAll('T', ' '),
                            style: const TextStyle(
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
                        const Text("Ngày trả:",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        Text(
                            widget.booking.dateReturnActual
                                .toString()
                                .substring(0, 16)
                                .replaceAll('T', ' '),
                            style: const TextStyle(
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
                        const Text("Loại xe:",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        Text(widget.booking.bike.categoryName!,
                            style: const TextStyle(
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
                        const Text("Tên chủ xe: ",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        Text(widget.booking.ownerName!,
                            style: const TextStyle(
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
                            style: const TextStyle(
                              fontSize: 18,
                            ))
                      ],
                    ),
                    const SizedBox(
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
                      children: const [
                        Text("Phương thức thanh toán: ",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        Text("Tiền mặt",
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
                            style: const TextStyle(
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
              padding: const EdgeInsets.only(
                  top: 10, left: 15, right: 15, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Tổng cộng",
                          style: TextStyle(
                            fontSize: 18,
                          )),
                      Text(
                          widget.booking.price
                                  .round()
                                  .toString()
                                  .replaceAllMapped(reg, mathFunc) +
                              ' đ',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            if (widget.booking.status == 0)
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 30,
                    margin: const EdgeInsets.only(right: 15),
                    child: RaisedButton(
                      onPressed: () {
                        showMyAlertDialog(size);
                      },
                      color: Colors.red,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: const Text(
                        "Hủy",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  )
                ],
              )
          ],
        ),
      ],
    );
  }

  Widget getCancelContent() {
    return TextField(
      controller: controller,
      maxLines: 5,
      style: const TextStyle(
        fontSize: 16,
      ),
      decoration: const InputDecoration(
          hintText: "Mô tả báo cáo..",
          hintStyle: TextStyle(fontSize: 16, color: Colors.black26),
          border: InputBorder.none),
    );
  }

  showMyAlertDialog(Size size) {
    showDialog(
      context: context,
      builder: (context) {
        String selectedReason = "";
        bool completed = false;
        return StatefulBuilder(
          builder: (context, setState) {
            Widget cancelReason(Size size, String text) {
              if (text != selectedReason) {
                return Container(
                    height: 35,
                    margin: const EdgeInsets.only(bottom: 10),
                    child: RaisedButton(
                      onPressed: () {
                        log(text);
                        setState(() {
                          selectedReason = text;
                          completed = true;
                        });
                      },
                      child: Text(text),
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: const BorderSide(
                              color: ColorConstants.containerBoldBackground)),
                    ));
              } else {
                return Container(
                    height: 35,
                    margin: const EdgeInsets.only(bottom: 10),
                    child: RaisedButton(
                      onPressed: null,
                      child: Text(text),
                      disabledTextColor: Colors.black,
                      disabledColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(
                            color: ColorConstants.containerBoldBackground),
                      ),
                    ));
              }
            }

            Color color = Colors.grey;
            if (completed) {
              color = Colors.red;
            }
            return Dialog(
              child: Container(
                decoration: const BoxDecoration(
                  color: ColorConstants.containerBackground,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Lý do bạn hủy?",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      cancelReason(size, "Giao xe trễ"),
                      SizedBox(
                        height: 10,
                      ),
                      cancelReason(size, "Xe không giống ảnh"),
                      SizedBox(
                        height: 10,
                      ),
                      cancelReason(size, "Khác"),
                      SizedBox(
                        height: 10,
                      ),
                      if (selectedReason == "Khác")
                        Center(
                          child: Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black54, width: 1),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10))),
                            padding: const EdgeInsets.all(10),
                            width: double.infinity,
                            child: Center(child: getCancelContent()),
                          ),
                        ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          RaisedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            color: Colors.grey[500],
                            child: const Text(
                              "Hủy",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Center(
                            child: RaisedButton(
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              onPressed: () async {
                                if (completed) {
                                  String content = "";
                                  if (selectedReason == "Khác") {
                                    content = controller.value.text;
                                  } else {
                                    content = selectedReason;
                                  }
                                  if (content.isEmpty) return;
                                  bool isSuccess =
                                      await _bookingTransactionViewModel
                                          .cancelBooking(widget.booking.id);
                                  if (isSuccess) {
                                    Fluttertoast.showToast(
                                      msg: "Hủy thành công",
                                      gravity: ToastGravity.CENTER,
                                      toastLength: Toast.LENGTH_SHORT,
                                    );
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute<dynamic>(
                                        builder: (BuildContext context) =>
                                            const AppointmentView(),
                                      ),
                                      (route) => false,
                                    );
                                  } else {
                                    Fluttertoast.showToast(
                                      msg: "Hủy thất bại! Xin hãy thử lại sau.",
                                      gravity: ToastGravity.CENTER,
                                      toastLength: Toast.LENGTH_SHORT,
                                    );
                                  }
                                }
                              },
                              color: color,
                              child: const Text(
                                "Xác nhận",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              backgroundColor: Colors.white,
            );
          },
        );
      },
    );
  }
}
