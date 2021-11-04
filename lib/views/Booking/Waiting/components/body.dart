import 'dart:convert';
import 'package:chothuexemay_mobile/models/order_model.dart';
import 'package:chothuexemay_mobile/models/owner_model.dart';
import 'package:chothuexemay_mobile/utils/constants.dart';
import 'package:chothuexemay_mobile/view_model/customer_view_model.dart';
import 'package:chothuexemay_mobile/views/Booking/Result/result_view.dart';
import 'package:chothuexemay_mobile/views/Home/home_view.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BodyWaiting extends StatefulWidget {
  OrderModel order;

  BodyWaiting({Key? key, required this.order}) : super(key: key);

  @override
  State<BodyWaiting> createState() => _BodyWaitingState();
}

class _BodyWaitingState extends State<BodyWaiting> {
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  List<Owner> listOwner = [];
  CustomerViewModel customerViewModel = CustomerViewModel();

  void firebaseCloudMessaging_Listeners() {
    _fcm.getToken().then((token) async {
      print("++++++++++++++" + token!);
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage evt) {
      final data = jsonDecode(evt.data["data"]);
      bool isAccepted = data["IsAccepted"];
      String ownerId = data["OwnerId"];
      if (listOwner.isEmpty) {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return ResultView();
          },
        ));
      }
      Owner owner = listOwner[0];
      if (isAccepted) {
        OrderModel orderModel = OrderModel.createBooking(
            ownerId: ownerId,
            licensePlate: owner.bike.licensePlate,
            cateName: owner.bike.categoryName,
            dateRent: widget.order.dateRent,
            dateReturn: widget.order.dateReturn,
            imgPath: owner.bike.imgPath,
            address: widget.order.address,
            totalPrice: widget.order.totalPrice,
            typeId: widget.order.typeId,
            bikeId: owner.bike.id,
            categoryId: owner.bike.categoryId,
            voucherCode: widget.order.voucherCode);
        customerViewModel.createBooking(orderModel);
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return ResultView(owner: owner);
          },
        ));
      } else {
        listOwner.removeWhere((element) {
          return element.id == ownerId;
        });
        if (listOwner.isEmpty) {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return ResultView();
            },
          ));
        }
        OrderModel orderNoti = OrderModel.sendNoti(
            ownerId: owner.id,
            licensePlate: owner.bike.licensePlate,
            cateName: owner.bike.categoryName,
            dateRent: widget.order.dateRent,
            dateReturn: widget.order.dateReturn,
            imgPath: owner.bike.imgPath,
            address: widget.order.address,
            totalPrice: widget.order.totalPrice);
        customerViewModel.sendNoti(orderNoti);
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    findBike();
    firebaseCloudMessaging_Listeners();
  }

  findBike() async {
    listOwner = await Provider.of<CustomerViewModel>(context, listen: false)
        .findBikes(widget.order, context);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              StringConstants.imageDirectory + "loading.gif",
              width: size.width * 0.75,
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              padding: EdgeInsets.only(
                  left: size.width * 0.12, right: size.width * 0.12),
              child: const Text(
                "Hệ thống đang tìm xe, mong bạn chờ một xíu nhé...",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        )
      ],
    );
  }
}
