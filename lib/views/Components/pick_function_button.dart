// ignore_for_file: must_be_immutable, sized_box_for_whitespace, deprecated_member_use, prefer_const_constructors

import 'package:chothuexemay_mobile/utils/constants.dart';
import 'package:flutter/material.dart';

class PickFuntionButton extends StatefulWidget {
  String text;
  String selected;
  Function() func;

  double sizeButton;
  PickFuntionButton(
      {Key? key,
      required this.text,
      required this.selected,
      required this.func,
      required this.sizeButton})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _PickFuntionButton();
  }
}

class _PickFuntionButton extends State<PickFuntionButton> {
  @override
  Widget build(BuildContext context) {
    if (widget.selected != widget.text) {
      return Container(
          width: widget.sizeButton,
          height: 35,
          child: RaisedButton(
            onPressed: widget.func,
            child: Text(widget.text),
            textColor: ColorConstants.textBold,
            color: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(color: ColorConstants.textBold)),
          ));
    } else {
      return Container(
        width: widget.sizeButton,
        height: 35,
        child: RaisedButton(
          onPressed: null,
          child: Text(widget.text),
          disabledTextColor: Colors.black,
          disabledColor: ColorConstants.containerBoldBackground,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(color: ColorConstants.textBold)),
        ),
      );
    }
  }
}
