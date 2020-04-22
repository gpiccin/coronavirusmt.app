import 'package:coronavirusmt/core/locator.dart';
import 'package:coronavirusmt/core/viewmodels/covid/obitos_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setupLocator();

  test('Recupera a lista de óbitos', () async {
    ObitosViewModel model = ObitosViewModel();
    await model.loadData();
    assert(model.obitos.length > 0);
  });
}
