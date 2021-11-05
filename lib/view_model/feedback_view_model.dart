import 'package:chothuexemay_mobile/Repositories/Implementations/feedback_repository.dart';
import 'package:chothuexemay_mobile/Repositories/Interfaces/feedback_interface.dart';
import 'package:chothuexemay_mobile/models/feedback_model.dart';
import 'package:flutter/cupertino.dart';

class FeedbackViewModel extends ChangeNotifier {
  final IFeedbackRepository _repository = FeedbackRepository();

  Future<FeedbackModel> getById(String id) async {
    return await _repository.getById(id);
  }

  Future<bool> submitFeedback(FeedbackModel model) async {
    return await _repository.submitFeedback(model);
  }
}
