import 'package:chothuexemay_mobile/models/bike_model.dart';
import 'package:chothuexemay_mobile/utils/constants.dart';
import 'package:chothuexemay_mobile/view_model/bike_view_model.dart';
import 'package:chothuexemay_mobile/views/Components/brief_info_owner.dart';
import 'package:chothuexemay_mobile/views/OwnerDetail/owner_detail_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';

class HomeBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeBody();
  }
}

class _HomeBody extends State<HomeBody> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<BikeViewModel>(context, listen: false).getAll();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Bike> bikeList = Provider.of<BikeViewModel>(context).bikes;
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
            scrollDirection: Axis.vertical,
            child: Column(
              children: getList(bikeList),
            ),
          ))
        ],
      ),
    );
  }

  List<Widget> getList(List<Bike> bikeList) {
    List<Widget> childs = [];
    for (var item in bikeList) {
      childs.add(
        BriefInfoOwner(
            image: "thuexe.png",
            ownerName: item.ownerName,
            totalBike: 13,
            totalRating: item.numberOfRating,
            rate: item.rating,
            checkCMND: true,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return OwnerDetailView(name: item.ownerName);
                },
              ));
            }),
      );
    }
    return childs;
  }
}
