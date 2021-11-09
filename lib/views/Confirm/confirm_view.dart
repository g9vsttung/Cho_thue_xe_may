
import 'package:chothuexemay_mobile/utils/constants.dart';
import 'package:chothuexemay_mobile/views/Components/app_bar.dart';
import 'package:chothuexemay_mobile/views/Confirm/components/body.dart';
import 'package:flutter/material.dart';

class ConfirmView extends StatelessWidget {
  String licensePlate;
  String id;
  String color;
  String modelYear;
  String imgPath;
  ConfirmView({Key? key, required this.licensePlate, required this.id,required this.modelYear,required this.color,required this.imgPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorConstants.background,
        title: TopAppBarTitle(
          title: "Xác nhận",
          hasBack: false,
        ),
      ),
      body: BodyConfirm(
        licensePlate:licensePlate ,
        id: id,
        color: color,
        imgPath: imgPath,
        modelYear: modelYear,
      )
    );
  }
}
