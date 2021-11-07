import 'package:chothuexemay_mobile/Repositories/Interfaces/report_interface.dart';
import 'package:chothuexemay_mobile/models/report_model.dart';
import 'package:chothuexemay_mobile/services/report_service.dart';

class ReportRepository implements IReportRepository {
  final ReportService _service = ReportService();
  @override
  Future<bool> submitReport(Report report) async {
    return await _service.submitReport(report);
  }

  @override
  Future<Report> getReport(String id) async {
    return await _service.getReport(id);
  }
}
