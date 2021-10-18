// ignore_for_file: prefer_const_constructors

import 'dart:ui';
import 'package:chothuexemay_mobile/models/motor_type_model.dart';
import 'package:chothuexemay_mobile/models/price_model.dart';
import 'package:chothuexemay_mobile/utils/constants.dart';
import 'package:chothuexemay_mobile/view_model/motor_type_view_model.dart';
import 'package:chothuexemay_mobile/views/Booking/BookingDetail/booking_detail_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
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
  bool first = true;
  final int LIMIT_DATE = 5;
  DateTime dateRent = DateTime.now();
  DateTime dateReturn = DateTime.now().add(Duration(days: 1));
  PriceDataTable? bikeType;
  MotorType? selectedType;

  List<PriceDataTable> dataTable = [
    PriceDataTable(
        typeId: "d70ec77a-aadf-4dd5-b9e4-00b795263387",
        bikeType: "Xe tay côn",
        price: 140),
    PriceDataTable(
        typeId: "8922aeda-6522-4046-9c85-32f86d41faae",
        bikeType: "Xe gắn máy",
        price: 90),
    PriceDataTable(
        typeId: "0ac44f7e-599b-4f49-8f26-076834d8ce7a",
        bikeType: "Xe tay ga",
        price: 120),
  ];
  List<DateTime> listDateRent = [];
  List<DateTime> listDateReturn = [];

  @override
  Widget build(BuildContext context) {
    setDateAndList();
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(
          top: 15,
          left: size.width * 0.04,
          right: size.width * 0.04,
          bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Bảng giá tham khảo",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: ColorConstants.textBold,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "*Bảng giá được thay đổi theo vùng",
                style: TextStyle(fontSize: 10, fontStyle: FontStyle.italic),
              )
            ],
          ),
          Table(
            border: TableBorder.all(color: Colors.black, width: 1),
            children: [
              TableRow(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Loại xe",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: ColorConstants.textBold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Giá tiền",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: ColorConstants.textBold),
                  ),
                ),
              ]),
              for (PriceDataTable data in dataTable)
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      data.bikeType,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      data.price.toString() + ".000/ngày",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ]),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: Text(
              "Đặt xe ngay",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: ColorConstants.textBold,
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Center(
            child: dropDownBoxBikeType(),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Ngày thuê:",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  dropDownBoxDate(listDateRent, "Rent"),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Ngày trả:",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  dropDownBoxDate(listDateReturn, "Return"),
                ],
              )
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Center(
            child: RaisedButton(
              color: Colors.orange,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return BookingDetailView(
                        dateRent: dateRent.day.toString() +
                            "/" +
                            dateRent.month.toString() +
                            "/" +
                            dateRent.year.toString(),
                        dateReturn: dateReturn.day.toString() +
                            "/" +
                            dateReturn.month.toString() +
                            "/" +
                            dateReturn.year.toString(),
                        cateBike: bikeType!);
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

  Widget dropDownBoxDate(List<DateTime> list, String type) {
    Size size = MediaQuery.of(context).size;
    DateTime value = DateTime.now();
    if (type == "Rent")
      value = dateRent;
    else if (type == "Return") value = dateReturn;
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
            if (x != null)
              setState(() {
                if (type == "Rent") {
                  dateRent = x;
                  dateReturn = x.add(Duration(days: 1));
                } else if (type == "Return") dateReturn = x;
              });
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
                      fontSize: 16,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ));
          }).toList()),
    );
  }

  Widget dropDownBoxBikeType() {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.4,
      height: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.black, width: 1),
      ),
      child: DropdownButton(
          underline: const SizedBox(),
          value: selectedType,
          onChanged: (MotorType? x) {
            setState(() {
              selectedType = x;
            });
          },
          iconSize: 12,
          icon: Image.asset(
            "assets/icons/dropDown.png",
            color: Colors.black,
            width: 12,
          ),
          items: widget.types.map((MotorType t) {
            return DropdownMenuItem(
                value: t,
                child: SizedBox(
                  width: size.width * 0.4 - 20,
                  child: Text(
                    t.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
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
      bikeType = dataTable[0];
      selectedType = widget.types[0];
      for (int i = 0; i < LIMIT_DATE; i++)
        listDateRent.add(DateTime.now().add(Duration(days: i)));
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
}
