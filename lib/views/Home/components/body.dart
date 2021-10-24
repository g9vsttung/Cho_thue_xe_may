// ignore_for_file: prefer_const_constructors

import 'dart:ui';
import 'package:chothuexemay_mobile/models/motor_type_model.dart';
import 'package:chothuexemay_mobile/models/order_model.dart';
import 'package:chothuexemay_mobile/models/price_model.dart';
import 'package:chothuexemay_mobile/utils/constants.dart';
import 'package:chothuexemay_mobile/views/Booking/BookingDetail/booking_detail_view.dart';
import 'package:chothuexemay_mobile/views/Home/components/cate_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class BodyHome extends StatefulWidget {
  List<MotorType> types;

  BodyHome({Key? key, required this.types}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _BodyHome();
  }
}

class _BodyHome extends State<BodyHome> {
  TextEditingController addressController = TextEditingController();
  //Format currency number
  RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  // ignore: prefer_function_declarations_over_variables
  String Function(Match) mathFunc = (Match match) => '${match[1]}.';

  bool first = true;
  final int LIMIT_DATE = 5;
  DateTime dateRent = DateTime.now();
  DateTime dateReturn = DateTime.now().add(Duration(days: 1));

  //selected var
  PriceDataTable? selectedCate;
  MotorType? selectedType;
  TimeOfDay selectedTime = TimeOfDay.now();
  String selectedMethod = "day";
  int durationHour = 1;

  //list
  List<int> listHour = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
  List<PriceDataTable> dataTable = [
    PriceDataTable(
        typeId: "d70ec77a-aadf-4dd5-b9e4-00b795263387",
        bikeType: "Tay côn",
        img: "tayCon.png",
        price: 140),
    PriceDataTable(
        typeId: "8922aeda-6522-4046-9c85-32f86d41faae",
        bikeType: "Xe số",
        img: "xeSo.png",
        price: 90),
    PriceDataTable(
        typeId: "0ac44f7e-599b-4f49-8f26-076834d8ce7a",
        bikeType: "Xe ga",
        img: "tayGa.png",
        price: 120),
  ];
  List<DateTime> listDateRent = [];
  List<DateTime> listDateReturn = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedCate = dataTable[0];
  }

  @override
  Widget build(BuildContext context) {
    setDateAndList();
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(
          top: 25,
          left: size.width * 0.07,
          right: size.width * 0.07,
          bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Text(
                    "Địa chỉ của bạn:",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "22A đường số 7, phường 3, quận 8,... ",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
              SizedBox(
                height: 5,
              ),
              Container(
                child: TextField(
                  controller: addressController,
                  decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.all(10),
                      hintText: "Nhập địa chỉ nếu định vị không chính xác...",
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                            color: ColorConstants.textBold,
                            width: 1,
                          ))),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [for (PriceDataTable x in dataTable) getCateButton(x)],
          ),
          getPrice(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              getMethodButton("day", size),
              getMethodButton("hour", size)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Ngày thuê:",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  dropDownBoxDate(listDateRent, "Rent"),
                ],
              ),
              getReturnByMethod()
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Giờ nhận xe:",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Container(
                      height: 30,
                      child: Container(
                        height: 30,
                        child: RaisedButton(
                          onPressed: () {
                            selectTime();
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                StringConstants.iconDirectory + "clock.png",
                                width: 25,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Chọn giờ",
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          color: ColorConstants.containerBoldBackground,
                        ),
                      ))
                ],
              ),
              SizedBox(
                height: 0,
              ),
              Text(
                selectedTime.hour.toString() +
                    ":" +
                    selectedTime.minute.toString(),
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ],
          ),
          Center(
            child: RaisedButton(
              color: Colors.orange,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              onPressed: () {
                dateRent = dateRent.add(Duration(
                    hours: selectedTime.hour, minutes: selectedTime.minute));
                if (selectedMethod == "day") {
                  dateReturn = dateReturn.add(Duration(hours: 23, minutes: 59));
                } else {
                  dateReturn = dateRent.add(Duration(hours: durationHour));
                }
                OrderModel order = OrderModel(
                    dateRent: dateRent,
                    dateReturn: dateReturn,
                    cateBike: selectedCate!,
                    rentMethod: selectedMethod,
                    address: addressController.value.text);
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return BookingDetailView(order: order);
                  },
                ));
              },
              child: Text(
                "ĐẶT XE",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget getReturnByMethod() {
    Size size = MediaQuery.of(context).size;
    if (selectedMethod == "day") {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Ngày trả:",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 8,
          ),
          dropDownBoxDate(listDateReturn, "Return"),
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Số giờ thuê:",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            width: size.width * 0.4,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.black, width: 1),
            ),
            child: DropdownButton(
                underline: const SizedBox(),
                value: durationHour,
                onChanged: (int? x) {
                  if (x != null) {
                    setState(() {
                      durationHour = x;
                    });
                  }
                },
                iconSize: 12,
                icon: Image.asset(
                  "assets/icons/dropDown.png",
                  color: Colors.black,
                  width: 12,
                ),
                items: listHour.map((int t) {
                  return DropdownMenuItem(
                      value: t,
                      child: SizedBox(
                        width: size.width * 0.4 - 20,
                        child: Text(
                          t.toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ));
                }).toList()),
          )
        ],
      );
    }
  }

  Widget dropDownBoxDate(List<DateTime> list, String type) {
    Size size = MediaQuery.of(context).size;
    DateTime value = DateTime.now();
    if (type == "Rent") {
      value = dateRent;
    } else if (type == "Return") {
      value = dateReturn;
    }
    return Container(
      width: size.width * 0.4,
      height: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.black, width: 1),
      ),
      child: DropdownButton(
          underline: const SizedBox(),
          value: value,
          onChanged: (DateTime? x) {
            if (x != null) {
              setState(() {
                if (type == "Rent") {
                  dateRent = x;
                  dateReturn = x.add(Duration(days: 1));
                } else if (type == "Return") {
                  dateReturn = x;
                }
              });
            }
          },
          iconSize: 12,
          icon: Image.asset(
            "assets/icons/dropDown.png",
            color: Colors.black,
            width: 12,
          ),
          items: list.map((DateTime t) {
            String text = t.day.toString() +
                "/" +
                t.month.toString() +
                "/" +
                t.year.toString();
            return DropdownMenuItem(
                value: t,
                child: SizedBox(
                  width: size.width * 0.4 - 20,
                  child: Text(
                    text,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ));
          }).toList()),
    );
  }

  setDateAndList() {
    if (first) {
      first = false;
      selectedCate = dataTable[0];
      selectedType = widget.types[0];
      for (int i = 0; i < LIMIT_DATE; i++) {
        listDateRent.add(DateTime.now().add(Duration(days: i)));
      }
    }
    List<int> ymd = [dateRent.year, dateRent.month, dateRent.day];
    dateRent = DateTime(ymd[0], ymd[1], ymd[2]);
    listDateRent = [
      for (int i = 1; i <= LIMIT_DATE; i++)
        DateTime(ymd[0], ymd[1], ymd[2]).add(Duration(days: i - 1))
    ];
    listDateReturn = [
      for (int i = 1; i <= LIMIT_DATE; i++)
        DateTime(ymd[0], ymd[1], ymd[2]).add(Duration(days: i))
    ];
    //
    ymd = [dateReturn.year, dateReturn.month, dateReturn.day];
    dateReturn = DateTime(ymd[0], ymd[1], ymd[2]);
  }

  Widget getCateButton(PriceDataTable x) {
    Color textColor = Colors.black;
    Color containerColor = Colors.white;
    if (selectedCate == x) {
      textColor = Colors.white;
      containerColor = Color.fromRGBO(47, 147, 31, 1);
    }
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCate = x;
        });
      },
      child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: containerColor,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                StringConstants.iconDirectory + x.img,
                width: 50,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                x.bikeType,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: textColor),
              )
            ],
          )),
    );
  }

  Widget getPrice() {
    String text = "";
    if (selectedMethod == "day") {
      text = "Giá: " + selectedCate!.price.toString() + ".000 vnđ/ngày";
    } else {
      text = "Giá: " +
          (selectedCate!.price * 1.1 / 24).round().toString() +
          ".000 vnđ/giờ";
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          StringConstants.iconDirectory + "money.png",
          width: 30,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          text,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  Widget getMethodButton(String method, Size size) {
    String text = "";
    Color containerColor = Colors.black12;
    if (selectedMethod == method) {
      containerColor = ColorConstants.containerBoldBackground;
    }
    if (method == "day") {
      text = "Ngày";
    } else {
      text = "Giờ";
    }
    return Container(
      height: 35,
      width: size.width * 0.33,
      child: RaisedButton(
        onPressed: () {
          setState(() {
            selectedMethod = method;
          });
        },
        color: containerColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Text(
          text,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
    );
  }

  selectTime() async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (timeOfDay != null && timeOfDay != selectedTime) {
      setState(() {
        selectedTime = timeOfDay;
      });
    }
  }
}
