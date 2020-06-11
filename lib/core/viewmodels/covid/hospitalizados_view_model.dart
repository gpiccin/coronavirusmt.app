import 'package:collection/collection.dart';
import 'package:coronavirusmt/core/enum/viewstate.dart';
import 'package:coronavirusmt/core/locator.dart';
import 'package:coronavirusmt/core/models/boletim.dart';
import 'package:coronavirusmt/core/models/covid_hospitalizado_historico.dart';
import 'package:coronavirusmt/core/models/covid_por_tipo_de_leito.dart';
import 'package:coronavirusmt/core/models/key_value.dart';
import 'package:coronavirusmt/core/services/boletim_service.dart';
import 'package:coronavirusmt/core/services/covid_service.dart';
import 'package:coronavirusmt/core/viewmodels/shared/base_view_model.dart';

class HospitalizadosViewModel extends BaseViewModel {
  List<CovidHospitalizadoHistorico> _historico;
  List<CovidPorTipoDeLeito> _covidPorTipoDeLeito;
  Boletim _boletim;

  List<KeyValue> get historicoPorDia {
    var result = _historico
        .map((caso) => KeyValue(key: caso.data, value: caso.casosTotais))
        .toList();

    result.sort((a, b) => a.key.compareTo(b.key));

    return result;
  }

  int get hospitalizados => _boletim.covidHospitalizados;
  int get novos => _boletim.covidNovosHospitalizados;
  double get percentual => _boletim.covidPercentualDeHospitalizados;

  int get utiTotal {
    return _getCasos("UTI").map((m) => m.casosTotais).reduce((a, b) => a + b);
  }

  int get enfermariaTotal {
    return _getCasos("Enfermaria")
        .map((m) => m.casosTotais)
        .reduce((a, b) => a + b);
  }

  List<CovidPorTipoDeLeito> get enfermaria {
    var casos = _getCasos("Enfermaria");
    casos.sort((a, b) => a.rede.compareTo(b.rede));
    return casos;
  }

  List<CovidPorTipoDeLeito> get uti {
    var casos = _getCasos("UTI");
    casos.sort((a, b) => a.rede.compareTo(b.rede));
    return casos;
  }

  List<CovidPorTipoDeLeito> _getCasos(String tipoDeLeito) {
    var grupoPorLeito = groupBy(_covidPorTipoDeLeito, (caso) => caso.leito);

    if (grupoPorLeito.containsKey(tipoDeLeito))
      return grupoPorLeito[tipoDeLeito];

    return List<CovidPorTipoDeLeito>();
  }

  loadData(DateTime data) async {
    setState(ViewState.Busy);

    CovidService covidService = locator<CovidService>();
    _covidPorTipoDeLeito = await covidService.getCovidPorTipoDeLeito(data);
    _historico = await covidService.getCasosHospitalizadosDeCovidHistorico();

    BoletimService boletimService = locator<BoletimService>();
    _boletim = await boletimService.getUltimoBoletim();

    setState(ViewState.Idle);
  }
}
