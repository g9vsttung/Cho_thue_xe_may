import 'package:chothuexemay_mobile/models/voucher_model.dart';

class VoucherViewModel{
  int calculateDate(DateTime date){
    int result=0;
    DateTime now=DateTime.now();
    Duration duration=date.difference(now);
    if(duration.inMinutes > 0) {
      result=duration.inDays+1;
    } else{
      result=duration.inDays;
    }
    return result;
  }
  String convertDateTimeToString(DateTime date){
    String result="";
    result=date.toString().split(" ")[0].replaceAll("-", ".");
    return result;
  }
  double calculatePriceAfterApplyVoucher(VoucherModel voucher, double price){
    return price*(1-voucher.sale/100);
  }
}