import 'package:get/get.dart';
import 'package:money_record/data/source/source_history.dart';

class CHome extends GetxController{
  final _today = 0.0.obs;
  double get today => _today.value;

  final _todayPercent = 0.0.obs;
  double get todayPercent => _todayPercent.value;

  //get data from source
  getAnalysis(String idUser) async {
    Map data = await SourceHistory.analysis(idUser);

    _today.value = data['today'];

    double yesterday = data['yesterday'];
    double different = (today-yesterday).obs();
    bool isSame = today.isEqual(yesterday);
    bool isPlus = today.isGreaterThan(yesterday);
    double byYesterday = yesterday == 0 ? 1 : yesterday;
    double percent = (different/byYesterday) * 100;
    _todayPercent.value = (isSame
      ? '100% dengan kemarin'
      : isPlus
        ? '+${percent.toStringAsFixed(0)}% dibanding kemarin'
        : '-${percent.toStringAsFixed(0)}% di banding kemarin') as double;
  }

}