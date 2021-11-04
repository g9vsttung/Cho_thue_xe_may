import 'package:chothuexemay_mobile/models/booking_transaction.dart';
import 'package:chothuexemay_mobile/utils/constants.dart';
import 'package:chothuexemay_mobile/views/Components/app_bar.dart';
import 'package:chothuexemay_mobile/views/Feedback/components/body.dart';
import 'package:flutter/material.dart';

class FeedbackView extends StatelessWidget {
  BookingTranstion booking;

  FeedbackView({required this.booking});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorConstants.background,
        title: TopAppBarTitle(
          title: "Đánh giá",
          func: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: BodyFeedback(
        booking: booking,
      ),
    );
  }
}
