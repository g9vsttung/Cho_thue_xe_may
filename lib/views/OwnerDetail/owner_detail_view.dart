import 'package:chothuexemay_mobile/utils/constants.dart';
import 'package:chothuexemay_mobile/views/Components/app_bar.dart';
import 'package:chothuexemay_mobile/views/Components/botton_app_bar.dart';
import 'package:chothuexemay_mobile/views/OwnerDetail/components/body.dart';
import 'package:flutter/material.dart';
class OwnerDetailView extends StatelessWidget{
  String name;
  OwnerDetailView({required this.name});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorConstants.background,
        title: TopAppBarTitle(title: name,),
      ),
      body: OwnerDetailBody(name: name,rate: 4.5,),
      bottomNavigationBar: BottomAppBar(
        color: ColorConstants.background,
        child: BottomBar(selected: ""),
      ),
    );
  }

}