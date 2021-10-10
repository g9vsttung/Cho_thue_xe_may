// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:chothuexemay_mobile/utils/constants.dart';
import 'package:chothuexemay_mobile/views/Components/app_bar.dart';
import 'package:chothuexemay_mobile/views/Components/botton_app_bar.dart';
import 'package:chothuexemay_mobile/views/OwnerDetail/components/body.dart';
import 'package:flutter/material.dart';

class OwnerDetailView extends StatelessWidget {
  String id;
  String name;
  double rating;
  OwnerDetailView({required this.id, required this.name, required this.rating});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorConstants.background,
        title: TopAppBarTitle(
          title: name,
        ),
      ),
      body: OwnerDetailBody(
        id: id,
        rate: rating, //Temporatry
      ),
      bottomNavigationBar: BottomAppBar(
        color: ColorConstants.background,
        child: BottomBar(selected: ""),
      ),
    );
  }
}
