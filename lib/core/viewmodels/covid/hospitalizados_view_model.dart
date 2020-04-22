import 'package:collection/collection.dart';
import 'package:coronavirusmt/core/enum/viewstate.dart';
import 'package:coronavirusmt/core/locator.dart';
import 'package:coronavirusmt/core/models/covid_por_tipo_de_leito.dart';
import 'package:coronavirusmt/core/services/covid_service.dart';
import 'package:coronavirusmt/core/viewmodels/shared/base_view_model.dart';

class HospitalizadosViewModel extends BaseViewModel {
  CovidService _covidService = locator<CovidService>();

  int get hospitalizados => _covidService.covidPorTipoDeLeito
      .map((m) => m.casosTotais)
      .reduce((a, b) => a + b);

  int get utiTotal {
    return _getCasos("UTI").map((m) => m.casosTotais).reduce((a, b) => a + b);
  }

  int get enfermariaTotal {
    return _getCasos("Enfermaria")
        .map((m) => m.casosTotais)
        .reduce((a, b) => a + b);
  }

  List<CovidPorTipoDeLeito> get enfermaria {
    return _getCasos("Enfermaria");
  }

  List<CovidPorTipoDeLeito> get uti {
    return _getCasos("UTI");
  }

  List<CovidPorTipoDeLeito> _getCasos(String tipoDeLeito) {
    var grupoPorLeito =
        groupBy(_covidService.covidPorTipoDeLeito, (caso) => caso.leito);

    if (grupoPorLeito.containsKey(tipoDeLeito))
      return grupoPorLeito[tipoDeLeito];

    return List<CovidPorTipoDeLeito>();
  }

  loadData(DateTime data) async {
    setState(ViewState.Busy);
    await _covidService.getCovidPorTipoDeLeito(data);
    setState(ViewState.Idle);
  }
}
