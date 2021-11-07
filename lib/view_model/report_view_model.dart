import 'package:chothuexemay_mobile/Repositories/Implementations/report_repository.dart';
import 'package:chothuexemay_mobile/Repositories/Interfaces/report_interface.dart';
import 'package:chothuexemay_mobile/models/report_model.dart';
import 'package:flutter/cupertino.dart';

class ReportViewModel extends ChangeNotifier {
  final IReportRepository _repository = ReportRepository();
  Future<bool> submitReport(Report report) async {
    return await _repository.submitReport(report);
  }

  Future<Report> getReport(String id) async {
    return await _repository.getReport(id);
  }
}
