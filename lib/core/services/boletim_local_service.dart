import 'package:coronavirusmt/core/constants.dart';
import 'package:hive/hive.dart';

class BoletimLocalService {
  static saveData(DateTime data) async {
    var dataBox = await box();
    dataBox.put('data', data);
  }

  static getData(Box box) {
    return box?.get('data');
  }

  static box() async {
    if (!Hive.isBoxOpen(Constants.HIVE_BOLETIM_BOX))
      return await Hive.openBox(Constants.HIVE_BOLETIM_BOX);

    return Hive.box(Constants.HIVE_BOLETIM_BOX);
  }
}
