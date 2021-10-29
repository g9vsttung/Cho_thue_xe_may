import 'package:chothuexemay_mobile/models/owner_model.dart';
import 'package:chothuexemay_mobile/utils/constants.dart';
import 'package:chothuexemay_mobile/models/approve_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class BodyApprove extends StatelessWidget {
  Owner owner;

  BodyApprove({required this.owner});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
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
                    for (int i = 1; i <= owner.bike.rating.round(); i++)
                      Image.asset(
                        StringConstants.iconDirectory + "star.png",
                        color: Colors.yellow,
                        width: 20,
                      ),
                    for (int i = 1; i < 5 - owner.bike.rating.round(); i++)
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
                      owner.bike.licensePlate,
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
                      owner.bike.categoryName,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Image.network(
            ImageConstants.getFullImagePath(owner.bike.imgPath),
            width: size.width * 0.75,
            height: size.width*0.75*3/4,
            fit: BoxFit.fill,
          ),
          Container(
            width: size.width * 0.4,
            child: RaisedButton(
              onPressed: () {},
              color: Colors.red,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: const Text(
                "HỦY ĐẶT",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
