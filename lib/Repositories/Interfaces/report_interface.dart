import 'package:chothuexemay_mobile/models/report_model.dart';

abstract class IReportRepository {
  Future submitReport(Report report);
  Future<bool> isReported(String id);
}
