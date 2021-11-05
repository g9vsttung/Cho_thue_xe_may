import 'package:chothuexemay_mobile/models/feedback_model.dart';
import 'package:chothuexemay_mobile/utils/constants.dart';
import 'package:chothuexemay_mobile/view_model/feedback_view_model.dart';
import 'package:chothuexemay_mobile/views/Appointment/appointment_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BodyFeedback extends StatefulWidget {
  FeedbackModel feedback;

  BodyFeedback({required this.feedback});

  @override
  State<StatefulWidget> createState() {
    return _BodyFeedback();
  }
}

class _BodyFeedback extends State<BodyFeedback> {
  int selectedRate = 0;
  String selectedReason = "";
  bool completed = false;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    selectedRate != 0 ? true : false;

    return Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Đánh giá trải nghiệm của bạn",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          getWidgetRatingStar(),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black54, width: 1),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              child: Center(child: getFeedbackContent()),
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

  Widget getFeedbackContent() {
    if (widget.feedback.isRating!) {
      controller.text = widget.feedback.content!;
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
          hintText: "Thật tuyệt ...",
          hintStyle: TextStyle(fontSize: 16, color: Colors.black26),
          border: InputBorder.none),
    );
  }

  Widget getWidgetRatingStar() {
    if (widget.feedback.isRating!) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (int i = 1; i <= widget.feedback.rating!; i++) getStar(true, i),
          for (int i = 1; i <= 5 - widget.feedback.rating!; i++)
            getStar(false, widget.feedback.rating! + i),
        ],
      );
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 1; i <= selectedRate; i++) getStar(true, i),
        for (int i = 1; i <= 5 - selectedRate; i++)
          getStar(false, selectedRate + i),
      ],
    );
  }

  Widget getSubmitButton(Size size) {
    if (!widget.feedback.isRating!) {
      if (completed) {
        return Center(
          child: Container(
            width: size.width * 0.6,
            child: RaisedButton(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              onPressed: () async {
                final FeedbackViewModel _model = FeedbackViewModel();
                FeedbackModel fb = FeedbackModel(
                  id: widget.feedback.id,
                  rating: selectedRate,
                  content: controller.value.text,
                );
                bool isSuccess = await _model.submitFeedback(fb);
                if (isSuccess) {
                  Fluttertoast.showToast(
                    msg: "Đánh giá thành công",
                    gravity: ToastGravity.CENTER,
                    toastLength: Toast.LENGTH_SHORT,
                  );
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute<dynamic>(
                      builder: (BuildContext context) => AppointmentView(),
                    ),
                    (route) => false,
                  );
                } else {
                  Fluttertoast.showToast(
                    msg: "Đánh giá thất bại! Xin hãy thử lại sau.",
                    gravity: ToastGravity.CENTER,
                    toastLength: Toast.LENGTH_SHORT,
                  );
                }
              },
              color: ColorConstants.containerBoldBackground,
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
        return Container(
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

  Widget getStar(bool light, int num) {
    if (light) {
      return Row(
        children: [
          GestureDetector(
              onTap: () {
                setState(() {
                  selectedRate = num;
                });
              },
              child: Image.asset(
                StringConstants.iconDirectory + "starRating.png",
                width: 35,
              )),
          const SizedBox(
            width: 5,
          )
        ],
      );
    } else {
      return Row(
        children: [
          GestureDetector(
              onTap: () {
                setState(() {
                  selectedRate = num;
                });
              },
              child: Image.asset(
                StringConstants.iconDirectory + "starBorder.png",
                width: 35,
              )),
          const SizedBox(
            width: 5,
          )
        ],
      );
    }
  }
}
