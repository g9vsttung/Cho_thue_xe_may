import 'package:chothuexemay_mobile/utils/constants.dart';
import 'package:chothuexemay_mobile/view_model/booking_view_model.dart';
import 'package:chothuexemay_mobile/views/Home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
class BodyConfirm extends StatelessWidget{
  String licensePlate;
  String id;
  String color;
  String modelYear;
  String imgPath;
  BodyConfirm({required this.licensePlate, required this.id,required this.modelYear,required this.color,required this.imgPath});
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return  Padding(
      padding:  EdgeInsets.all(size.width*0.15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Bạn đã nhận được xe có biển số [" + licensePlate + "]?",
            style:
            TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            maxLines: 3,
          ),
          const SizedBox(height: 15),
          Text(
           "Màu: "+color,
            style:
            TextStyle( fontSize: 20),
            maxLines: 3,
          ),
          const SizedBox(height: 15),
          Text(
            "Năm sản xuất: "+modelYear,
            style:
            TextStyle( fontSize: 20),
            maxLines: 3,
          ),
          const SizedBox(height: 15),
          Image.network(ImageConstants.getFullImagePath(imgPath),width: size.width*0.6,height: size.width*0.6*3/4,),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              RaisedButton(
                onPressed: () async {
                  Fluttertoast.showToast(
                    msg: "Đơn đặt này không được xác thực.",
                    gravity: ToastGravity.CENTER,
                    toastLength: Toast.LENGTH_SHORT,
                  );
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
                    return HomeView();
                  },), (route) => false);
                },
                color: Colors.red,
                child: const Text("Không"),
              ),
              SizedBox(
                width: 2,
              ),
              RaisedButton(
                onPressed: () async {
                  bool isSent =
                  await Provider.of<BookingTransactionViewModel>(
                      context,listen: false)
                      .confirmInformationOfBooking(id);
                  if (isSent) {
                    Fluttertoast.showToast(
                      msg: "Xác thực thành công",
                      gravity: ToastGravity.CENTER,
                      toastLength: Toast.LENGTH_SHORT,
                    );
                  } else {
                    Fluttertoast.showToast(
                      msg: "Xác thực thất bại",
                      gravity: ToastGravity.CENTER,
                      toastLength: Toast.LENGTH_SHORT,
                    );
                  }
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
                    return HomeView();
                  },), (route) => false);
                },
                color: ColorConstants.containerBoldBackground,
                child: const Text("Xác nhận"),
              ),
            ],
          ),
        ],
      ),
    );
  }
  
}