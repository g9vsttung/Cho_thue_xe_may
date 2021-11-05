import 'package:chothuexemay_mobile/utils/constants.dart';
import 'package:chothuexemay_mobile/views/Components/app_bar.dart';
import 'package:chothuexemay_mobile/views/EditProfile/components/body.dart';
import 'package:flutter/material.dart';

class EditProfileView extends StatelessWidget {
  String name;
  String phone;

  EditProfileView({required this.name, required this.phone});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorConstants.background,
        title: TopAppBarTitle(
          title: "Sửa thông tin",
        ),
      ),
      body: BodyEditProfile(
        name: name,
        phone: phone,
      ),
    );
  }
}
