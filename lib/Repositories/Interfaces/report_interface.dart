import 'package:chothuexemay_mobile/models/report_model.dart';

abstract class IReportRepository {
  Future submitReport(Report report);
  Future<Report> getReport(String id);
}
