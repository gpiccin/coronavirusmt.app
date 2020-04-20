import 'package:coronavirusmt/core/locator.dart';
import 'package:coronavirusmt/core/viewmodels/covid/obitos_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setupLocator();

  test('Recupera os óbitos e verifica a idade média', () async {
    ObitosViewModel model = ObitosViewModel();
    await model.getObitos();
    expect(model.obitosPorFaixaEtaria.single, 5);
  });
}
