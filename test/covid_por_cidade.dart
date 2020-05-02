import 'package:coronavirusmt/core/locator.dart';
import 'package:coronavirusmt/core/viewmodels/covid/cidades_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setupLocator();

  test('Recupera a lista de cidades e suas informações sobre o covid-19',
      () async {
    CidadesViewModel model = CidadesViewModel();
    var cidades = await model.getCovidPorCidade(10, 0);
    assert(cidades.length > 0);
  });
}
