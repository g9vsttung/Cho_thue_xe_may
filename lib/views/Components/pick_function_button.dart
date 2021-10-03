import 'package:chothuexemay_mobile/utils/constants.dart';
import 'package:flutter/material.dart';
class PickFuntionButton extends StatefulWidget{
  String text;
  String selected;
  Function() func;

  double sizeButton;
  PickFuntionButton({required this.text, required this.selected, required this.func,required this.sizeButton});
  @override
  State<StatefulWidget> createState() {
    return _PickFuntionButton();
  }

}
class _PickFuntionButton extends State<PickFuntionButton>{
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;

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


