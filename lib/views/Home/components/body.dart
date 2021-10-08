// ignore_for_file: prefer_const_constructors

import 'package:chothuexemay_mobile/models/owner_model.dart';
import 'package:chothuexemay_mobile/utils/constants.dart';
import 'package:chothuexemay_mobile/view_model/owner_view_model.dart';
import 'package:chothuexemay_mobile/views/Components/brief_info_owner.dart';
import 'package:chothuexemay_mobile/views/OwnerDetail/owner_detail_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomeBody();
  }
}

class _HomeBody extends State<HomeBody> {
  @override
  void initState() {
    super.initState();
    Provider.of<OwnerViewModel>(context, listen: false).getAll();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Owner> ownerList = Provider.of<OwnerViewModel>(context).owners;
    return Padding(
      padding: EdgeInsets.only(
          top: 15,
          left: size.width * 0.04,
          right: size.width * 0.04,
          bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/icons/xeSo.png",
                      width: 70,
                    ),
                    Text(
                      "Xe số",
                      style: TextStyle(
                          fontSize: 16,
                          color: ColorConstants.selectedIcon,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              GestureDetector(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/icons/tayGa.png",
                      width: 70,
                    ),
                    Text(
                      "Tay ga",
                      style: TextStyle(
                          fontSize: 16,
                          color: ColorConstants.selectedIcon,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              GestureDetector(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/icons/tayCon.png",
                      width: 70,
                    ),
                    Text(
                      "Tay côn",
                      style: TextStyle(
                          fontSize: 16,
                          color: ColorConstants.selectedIcon,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 35,
          ),
          Text(
            "Đánh giá cao",
            style: TextStyle(
                color: ColorConstants.textBold,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
              child: SingleChildScrollView(
            //scrollDirection: Axis.vertical,
            child: Column(
              children: getList(ownerList),
            ),
          ))
        ],
      ),
    );
  }

  List<Widget> getList(List<Owner> ownerList) {
    List<Widget> childs = [];
    for (var item in ownerList) {
      childs.add(
        BriefInfoOwner(
            image: "thuexe.png",
            ownerName: item.fullname,
            totalBike: item.numberOfbikes,
            totalRating: item.numberOfRatings,
            rate: item.rating,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return OwnerDetailView(
                    id: item.id,
                    name: item.fullname,
                  );
                },
              ));
            }),
      );
    }
    return childs;
  }
}
