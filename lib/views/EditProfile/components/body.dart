import 'dart:developer';

import 'package:chothuexemay_mobile/utils/constants.dart';
import 'package:chothuexemay_mobile/view_model/customer_view_model.dart';
import 'package:chothuexemay_mobile/views/Profile/profile_view.dart';
import 'package:flutter/material.dart';

class BodyEditProfile extends StatefulWidget {
  String name;
  String phone;

  BodyEditProfile({required this.name, required this.phone});

  @override
  State<BodyEditProfile> createState() => _BodyEditProfileState();
}

class _BodyEditProfileState extends State<BodyEditProfile> {
  CustomerViewModel customerViewModel = CustomerViewModel();

  TextEditingController nameController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    nameController.text = widget.name;
    phoneController.text = widget.phone;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(size.width * 0.1),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                StringConstants.imageDirectory + "avatar.png",
                width: size.width * 0.2,
              )
            ],
          ),
          SizedBox(
            height: size.width * 0.1,
          ),
          const Text(
            "Họ và tên",
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(
            height: 2,
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black54, width: 1),
                borderRadius: BorderRadius.all(Radius.circular(5))),
            padding: EdgeInsets.only(left: 10),
            width: double.infinity,
            // height: size.height*0.3,
            child: Center(
              child: TextField(
                controller: nameController,
                maxLines: 1,
                style: const TextStyle(
                  fontSize: 16,
                ),
                decoration: const InputDecoration(border: InputBorder.none),
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          const Text(
            "Số điện thoại",
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(
            height: 2,
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black54, width: 1),
                borderRadius: BorderRadius.all(Radius.circular(5))),
            padding: EdgeInsets.only(left: 10),
            width: double.infinity,
            // height: size.height*0.3,
            child: Center(
              child: TextField(
                enabled: false,
                controller: phoneController,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 16,
                ),
                decoration: const InputDecoration(border: InputBorder.none),
              ),
            ),
          ),
          SizedBox(
            height: size.width * 0.1,
          ),
          Center(
            child: RaisedButton(
              onPressed: () async {
                await customerViewModel.updateProfile(
                    nameController.text, widget.phone);
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return ProfileView();
                  },
                ));
              },
              color: Colors.orange,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: const Text(
                "SỬA",
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
}
