// ignore_for_file: must_be_immutable

import 'package:chothuexemay_mobile/models/customer_model.dart';
import 'package:chothuexemay_mobile/utils/constants.dart';
import 'package:chothuexemay_mobile/view_model/authservice.dart';
import 'package:chothuexemay_mobile/views/Appointment/appointment_view.dart';
import 'package:chothuexemay_mobile/views/Booking/Voucher/voucher_view.dart';
import 'package:chothuexemay_mobile/views/EditProfile/edit_profile.dart';
import 'package:chothuexemay_mobile/views/Login/Step1/login_view_1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BodyProfile extends StatefulWidget {
  Customer customer;

  BodyProfile({Key? key, required this.customer}) : super(key: key);

  @override
  State<BodyProfile> createState() => _BodyProfileState();
}

class _BodyProfileState extends State<BodyProfile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding:
              const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
          color: Colors.white,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    StringConstants.imageDirectory + "avatar.png",
                    width: 65,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.customer.fullname,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Số điện thoại: " + widget.customer.phoneNumber,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Điển thưởng tích lũy: " +
                            widget.customer.rewardPoints.toString() +
                            "pts",
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      )
                    ],
                  )
                ],
              ),
              IconButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return EditProfileView(
                            name: widget.customer.fullname,
                            phone: widget.customer.phoneNumber);
                      },
                    ));
                  },
                  icon: Image.asset(
                    StringConstants.iconDirectory + "edit.png",
                    width: 25,
                  )),
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        getOptionFrame("Lịch đặt của tôi", () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return const AppointmentView();
            },
          ));
        }),
        getOptionFrame("Ưu đãi của tôi", () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return VoucherView(
                hasAction: false,
              );
            },
          ));
        }),
        getOptionFrame("Đăng xuất", () {
          AuthService _auth = AuthService();
          _auth.signOut();
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute<dynamic>(
              builder: (BuildContext context) => const LoginView1(),
            ),
            (route) => false,
          );
        })
      ],
    );
  }

  Widget getOptionFrame(String text, Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 2),
        padding:
            const EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 20),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              text,
              style: const TextStyle(fontSize: 18),
            ),
            Image.asset(
              StringConstants.iconDirectory + "detail.png",
              color: Colors.grey,
              width: 12,
            ),
          ],
        ),
      ),
    );
  }
}
