import 'package:chothuexemay_mobile/Repositories/Interfaces/feedback_interface.dart';
import 'package:chothuexemay_mobile/models/feedback_model.dart';
import 'package:chothuexemay_mobile/services/feedback_service.dart';

class FeedbackRepository extends IFeedbackRepository {
  final FeedbackService _service = FeedbackService();
  @override
  Future getAll() {
    throw UnimplementedError();
  }

  @override
  Future<FeedbackModel> getById(String id) async {
    return await _service.getById(id);
  }

  @override
  Future<bool> submitFeedback(FeedbackModel model) async {
    return await _service.submitFeedback(model);
  }
}
