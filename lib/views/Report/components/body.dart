// ignore_for_file: must_be_immutable, deprecated_member_use

import 'dart:developer';

import 'package:chothuexemay_mobile/models/report_model.dart';
import 'package:chothuexemay_mobile/utils/constants.dart';
import 'package:chothuexemay_mobile/view_model/feedback_view_model.dart';
import 'package:chothuexemay_mobile/views/Appointment/appointment_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BodyReport extends StatefulWidget {
  Report report;

  BodyReport({Key? key, required this.report}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _BodyReport();
  }
}

class _BodyReport extends State<BodyReport> {
  String selectedReason = "";
  bool completed = false;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Chọn nội dung báo cáo",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          reportReason(size, "Không liên lạc được"),
          const SizedBox(
            height: 10,
          ),
          reportReason(size, "Xe không giống mô tả"),
          const SizedBox(
            height: 10,
          ),
          reportReason(size, "Khác"),
          const SizedBox(
            height: 10,
          ),
          if (selectedReason == "Khác")
            Center(
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black54, width: 1),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                child: Center(child: getReportContent()),
              ),
            ),
          const SizedBox(
            height: 25,
          ),
          Center(
            child: getSubmitButton(size),
          )
        ],
      ),
    );
  }

  Widget reportReason(Size size, String text) {
    if (text != selectedReason) {
      return Container(
          width: size.width * 0.5,
          height: 35,
          margin: const EdgeInsets.only(bottom: 10),
          child: RaisedButton(
            onPressed: () {
              log(text);
              setState(() {
                selectedReason = text;
                completed = true;
              });
            },
            child: Text(text),
            color: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: const BorderSide(
                    color: ColorConstants.containerBoldBackground)),
          ));
    } else {
      return Container(
          width: size.width * 0.5,
          height: 35,
          margin: const EdgeInsets.only(bottom: 10),
          child: RaisedButton(
            onPressed: null,
            child: Text(text),
            disabledTextColor: Colors.black,
            disabledColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(
                  color: ColorConstants.containerBoldBackground),
            ),
          ));
    }
  }

  Widget getReportContent() {
    if (widget.report.isReport!) {
      controller.text = selectedReason;
      return TextField(
        controller: controller,
        maxLines: 5,
        style: const TextStyle(
          fontSize: 16,
        ),
        decoration: const InputDecoration(
            enabled: false,
            hintStyle: TextStyle(fontSize: 16, color: Colors.black26),
            border: InputBorder.none),
      );
    }
    return TextField(
      controller: controller,
      maxLines: 5,
      style: const TextStyle(
        fontSize: 16,
      ),
      decoration: const InputDecoration(
          hintText: "Mô tả báo cáo..",
          hintStyle: TextStyle(fontSize: 16, color: Colors.black26),
          border: InputBorder.none),
    );
  }

  Widget getSubmitButton(Size size) {
    if (!widget.report.isReport!) {
      if (completed) {
        return Center(
          child: SizedBox(
            width: size.width * 0.6,
            child: RaisedButton(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              onPressed: () async {
                final FeedbackViewModel _model = FeedbackViewModel();
                String content = "";
                if (selectedReason == "Khác") {
                  content = controller.value.text;
                } else {
                  content = selectedReason;
                }
                Report report = Report(
                  id: widget.report.id,
                  content: content,
                );
                bool isSuccess = true; //await _model.submitFeedback(fb);
                if (isSuccess) {
                  Fluttertoast.showToast(
                    msg: "Báo cáo thành công",
                    gravity: ToastGravity.CENTER,
                    toastLength: Toast.LENGTH_SHORT,
                  );
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute<dynamic>(
                      builder: (BuildContext context) =>
                          const AppointmentView(),
                    ),
                    (route) => false,
                  );
                }
                Fluttertoast.showToast(
                  msg: "Đánh giá thất bại! Xin hãy thử lại sau.",
                  gravity: ToastGravity.CENTER,
                  toastLength: Toast.LENGTH_SHORT,
                );
              },
              color: ColorConstants.background,
              child: const Text(
                "Gửi",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
        );
      } else {
        return SizedBox(
          width: size.width * 0.6,
          height: 40,
          child: RaisedButton(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            onPressed: () {},
            color: Colors.grey[400],
            child: const Text(
              "Gửi",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54),
            ),
          ),
        );
      }
    }
    return Container();
  }
}
