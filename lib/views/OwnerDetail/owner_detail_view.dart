import 'package:chothuexemay_mobile/models/owner_model.dart';
import 'package:chothuexemay_mobile/utils/constants.dart';
import 'package:chothuexemay_mobile/view_model/owner_view_model.dart';
import 'package:chothuexemay_mobile/views/Components/app_bar.dart';
import 'package:chothuexemay_mobile/views/Components/botton_app_bar.dart';
import 'package:chothuexemay_mobile/views/OwnerDetail/components/body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OwnerDetailView extends StatelessWidget {
  String id;
  String name;
  OwnerDetailView({required this.id, required this.name});
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
        rate: 4.0, //Temporatry
      ),
      bottomNavigationBar: BottomAppBar(
        color: ColorConstants.background,
        child: BottomBar(selected: ""),
      ),
    );
  }
}
