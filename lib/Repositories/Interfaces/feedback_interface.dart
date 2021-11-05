import 'package:chothuexemay_mobile/Repositories/generic_repository.dart';
import 'package:chothuexemay_mobile/models/feedback_model.dart';

abstract class IFeedbackRepository extends GenericRepository {
  Future<FeedbackModel> getById(String id);
  Future<bool> submitFeedback(FeedbackModel model);
}
