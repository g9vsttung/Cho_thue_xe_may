import 'package:chothuexemay_mobile/models/booking_transaction.dart';
import 'package:chothuexemay_mobile/models/feedback_model.dart';
import 'package:chothuexemay_mobile/utils/constants.dart';
import 'package:chothuexemay_mobile/view_model/feedback_view_model.dart';
import 'package:chothuexemay_mobile/views/Components/app_bar.dart';
import 'package:chothuexemay_mobile/views/Feedback/components/body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FeedbackView extends StatelessWidget {
  String bookingId;

  FeedbackView({required this.bookingId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorConstants.background,
        title: TopAppBarTitle(
          title: "Đánh giá",
        ),
      ),
      body: FutureBuilder(
        builder: (context, napshot) {
          if (napshot.connectionState == ConnectionState.done) {
            if (napshot.hasData) {
              final FeedbackModel feedback =
                  (napshot.data as dynamic)['feedback'] as FeedbackModel;
              return BodyFeedback(
                feedback: feedback,
              );
            }
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
        future: getData(context),
      ),
    );
  }

  Future<Map<String, dynamic>> getData(BuildContext context) async {
    Map<String, dynamic> list = {};

    list['feedback'] =
        await Provider.of<FeedbackViewModel>(context, listen: false)
            .getById(bookingId);
    return list;
  }
}
