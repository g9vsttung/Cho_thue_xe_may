// ignore_for_file: must_be_immutable, deprecated_member_use

import 'package:chothuexemay_mobile/models/owner_model.dart';
import 'package:chothuexemay_mobile/utils/constants.dart';
import 'package:chothuexemay_mobile/views/Home/home_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:url_launcher/url_launcher.dart';

class BodyApprove extends StatelessWidget {
  Owner owner;

  BodyApprove({Key? key, required this.owner}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                RaisedButton(
                    onPressed: () {
                      launch("tel://" + owner.phoneNumber);
                    },
                    color: Colors.green,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Image.asset(
                      StringConstants.iconDirectory + "phone.png",
                      width: 18,
                    )),
                const SizedBox(
                  width: 3,
                ),
                RaisedButton(
                  onPressed: () {},
                  color: Colors.red,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: const Text(
                    "HỦY",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                )
              ],
            ),
          ),
          const Text(
            "ĐÃ TÌM THẤY XE",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: ColorConstants.textBold,
            ),
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundImage:
                      AssetImage(StringConstants.imageDirectory + "avatar.png"),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  owner.fullname,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (int i = 1; i <= owner.bike.rating!.round(); i++)
                      Image.asset(
                        StringConstants.iconDirectory + "star.png",
                        color: Colors.yellow,
                        width: 20,
                      ),
                    for (int i = 1; i < 5 - owner.bike.rating!.round(); i++)
                      Image.asset(
                        StringConstants.iconDirectory + "star.png",
                        color: Colors.grey[300],
                        width: 20,
                      ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      owner.bike.licensePlate!,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Image.asset(
                      StringConstants.iconDirectory + "point.png",
                      color: Colors.black,
                      width: 14,
                    ),
                    Text(
                      owner.bike.categoryName!,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: Image.network(
              ImageConstants.getFullImagePath(owner.bike.imgPath!),
              width: size.width * 0.75,
              height: size.width * 0.75 * 3 / 4,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          RaisedButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                builder: (context) {
                  return const HomeView();
                },
              ), (route) => false);
            },
            color: Colors.orange,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5))),
            child: const Text(
              "Trở về trang chủ",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
