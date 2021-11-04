import 'package:chothuexemay_mobile/models/order_model.dart';
import 'package:chothuexemay_mobile/models/voucher_model.dart';
import 'package:chothuexemay_mobile/services/voucher_service.dart';
import 'package:chothuexemay_mobile/utils/constants.dart';
import 'package:chothuexemay_mobile/view_model/voucher_view_model.dart';
import 'package:chothuexemay_mobile/views/Booking/BookingDetail/booking_detail_view.dart';
import 'package:chothuexemay_mobile/views/Booking/Voucher/voucher_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class BodyVoucher extends StatefulWidget {
  OrderModel order;
  int point;
  List<Voucher> vouchersAvailable;
  List<Voucher> vouchersExchange;
  String? selectedTab;
  BodyVoucher(
      {required this.order,
      required this.vouchersAvailable,
      required this.vouchersExchange,
      required this.point,
      String? selectedTab}){
    if(selectedTab!=null) {
      this.selectedTab = selectedTab;
    }
  }

  @override
  State<StatefulWidget> createState() {
    return _BodyVoucher();
  }
}

class _BodyVoucher extends State<BodyVoucher> {
  VoucherViewModel voucherViewModel = VoucherViewModel();
  String selectedCate = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.selectedTab != null){
      selectedCate=widget.selectedTab!;
    }else{
      selectedCate="voucher";
    }
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
              top: 25,
            ),
            color: Colors.white,
            child: cateNavBar(),
          ),
          Container(
            padding: EdgeInsets.only(top: 5, bottom: 10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (selectedCate == "change")
                    Container(
                      color: Colors.white,
                      width: size.width,
                      padding: EdgeInsets.all(20),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Điểm thưởng",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  widget.point.toString(),
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Text(
                                  " pts",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.grey),
                                ),
                              ],
                            )
                          ]),
                    ),
                  SizedBox(
                    height: 20,
                  ),
                  for (Widget box in listVoucherByCate()) box,
                ],
              ),
            ),
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
        if (selectedCate == "voucher")
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
                "Voucher hiện có",
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
                  selectedCate = "voucher";
                });
              },
              child: const Text(
                "Voucher hiện có",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              )),

        //=====================FACIAL
        if (selectedCate == "change")
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
                "Đổi voucher",
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
                selectedCate = "change";
              });
            },
            child: const Text("Đổi voucher",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                )),
          ),
      ],
    );
  }

  List<Widget> listVoucherByCate() {
    if (selectedCate == "voucher") {
      return [
        for (Voucher voucher in widget.vouchersAvailable) voucherBox(voucher),
      ];
    } else {
      return [
        for (Voucher voucher in widget.vouchersExchange)
          voucherExchangeBox(voucher),
      ];
    }
  }

  Widget voucherBox(Voucher voucher) {
    Size size = MediaQuery.of(context).size;
    int noDate = voucherViewModel.calculateDate(voucher.date);
    return Container(
      padding:
          EdgeInsets.only(left: size.width * 0.05, right: size.width * 0.05),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  width: size.width * 0.9 * 0.78,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.all(7),
                  child: Row(children: [
                    Image.asset(
                      StringConstants.iconDirectory + "discount.png",
                      width: size.width * 0.16,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Giảm giá " +
                              voucher.discount.round().toString() +
                              "%",
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 3, right: 3),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  border: Border.all(
                                      color: Colors.orange, width: 1)),
                              child: Text(
                                noDate.toString() + " ngày nữa",
                                style: TextStyle(
                                    fontSize: 10, color: Colors.orange),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              voucherViewModel
                                  .convertDateTimeToString(voucher.date),
                              style: TextStyle(fontSize: 16, color: Colors.red),
                            )
                          ],
                        )
                      ],
                    )
                  ])),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return BookingDetailView(
                        order: widget.order,
                        voucher: voucher,
                      );
                    },
                  ));
                },
                child: Container(
                  width: size.width * 0.9 * 0.2,
                  height: size.width * 0.16 + 14,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Chọn",
                        style: TextStyle(
                            fontSize: 16,
                            color: ColorConstants.background,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }

  Widget voucherExchangeBox(Voucher voucher) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding:
          EdgeInsets.only(left: size.width * 0.05, right: size.width * 0.05),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  width: size.width * 0.9 * 0.78,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.all(7),
                  child: Row(children: [
                    Image.asset(
                      StringConstants.iconDirectory + "discount.png",
                      width: size.width * 0.16,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Giảm giá " +
                              voucher.discount.round().toString() +
                              "%",
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 3, right: 3),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  border: Border.all(
                                      color: Colors.orange, width: 1)),
                              child: Text(
                                voucher.pointExchange.toString() + "pts",
                                style: TextStyle(
                                    fontSize: 10, color: Colors.orange),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              voucherViewModel
                                  .convertDateTimeToString(voucher.date),
                              style: TextStyle(fontSize: 16, color: Colors.red),
                            )
                          ],
                        )
                      ],
                    )
                  ])),
              GestureDetector(
                onTap: () async {
                  bool isSuccess = await voucherViewModel
                      .exchangePointsToGetVoucher(voucher.id);
                  if (isSuccess) {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return VoucherView(order: widget.order);
                      },
                    ));
                  }
                },
                child: Container(
                  width: size.width * 0.9 * 0.2,
                  height: size.width * 0.16 + 14,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Đổi",
                        style: TextStyle(
                            fontSize: 16,
                            color: ColorConstants.background,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
