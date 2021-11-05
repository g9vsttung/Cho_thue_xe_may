import 'dart:convert';

import 'package:chothuexemay_mobile/apis/common.dart';
import 'package:chothuexemay_mobile/models/feedback_model.dart';
import 'package:chothuexemay_mobile/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class FeedbackService {
  Future<FeedbackModel> getById(String id) async {
    Uri url = Uri.parse(FeedbackApiPath.GET_BY_ID + id);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return FeedbackModel.jsonFrom(body);
    } else if (response.statusCode == 404) {
      return FeedbackModel.emptyModel(id: id);
    } else {
      throw Exception("Unable to perform request");
    }
  }

  Future<bool> submitFeedback(FeedbackModel model) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final response = await http.post(Uri.parse(BookingApiPath.BOOKING_BIKE),
        headers: <String, String>{
          'Content-Type': 'application/json ; charset=UTF-8',
          'Authorization':
              'Bearer ' + prefs.getString(GlobalDataConstants.TOKEN).toString()
        },
        body: jsonEncode(<String, String>{
          "id": model.id!,
          "rating": model.rating.toString(),
          "content": model.content!
        }));
    return response.statusCode == 200;
  }
}
