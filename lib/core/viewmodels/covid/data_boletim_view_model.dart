import 'package:coronavirusmt/core/viewmodels/shared/base_view_model.dart';

class DataBoletimViewModel extends BaseViewModel {
  DateTime _dataDoUltimoBoletim;

  DateTime get dataDoUltimoBoletim => _dataDoUltimoBoletim;

  void setDataDoUltimoBoletim(DateTime dataDoUltimoBoletim) {
    _dataDoUltimoBoletim = dataDoUltimoBoletim;
    notifyListeners();
  }
}
