import 'package:chothuexemay_mobile/models/voucher_model.dart';
import 'package:chothuexemay_mobile/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BodyVoucher extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BodyVoucher();
  }
}

class _BodyVoucher extends State<BodyVoucher> {
  String selectedCate = "voucher";
  List<VoucherModel> list=[
    VoucherModel(2, 3, "Ưu đãi 10.000 cho lần đặt đầu tiên hoặc miễn phí giao hàng duói 3km"),
    VoucherModel(1, 2, "Ưu đãi 50.000 cho đơn hàng trên 200.000 hoặc miễn phí giao hàng duói"),
    VoucherModel(6, 1, "Ưu đãi 20% cho lần đặt đầu tiên hoặc miễn phí giao hàng"),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.grey[300],
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 25,bottom: 10),
            color: Colors.white,
            child: cateNavBar(),
          ),
          Container(
            padding: EdgeInsets.only(top: 25, left: size.width*0.1,right: size.width*0.1,bottom: 10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for(VoucherModel voucher in list)
                    voucherBox(voucher),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  Widget cateNavBar(){
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
  Widget voucherBox(VoucherModel voucher){
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.white
          ),
          padding: EdgeInsets.all(5),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    voucher.date.toString()+" ngày nữa",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.red
                    ),
                  ),
                  Text(
                    "x"+voucher.quantity.toString(),
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.orange
                    ),
                  )
                ],
              ),
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.only(left: 10,right: 10),
                width: size.width*0.7,
                child: Text(
                  voucher.description,
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Xem thêm",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        SizedBox(height: 10,)
      ],
    );
  }
}
