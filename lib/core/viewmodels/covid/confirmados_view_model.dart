import 'package:coronavirusmt/core/enum/viewstate.dart';
import 'package:coronavirusmt/core/locator.dart';
import 'package:coronavirusmt/core/models/covid_historico.dart';
import 'package:coronavirusmt/core/models/key_value.dart';
import 'package:coronavirusmt/core/services/covid_service.dart';
import 'package:coronavirusmt/core/viewmodels/base_view_model.dart';

class ConfirmadosViewModel extends BaseViewModel {
  CovidService _covidService = locator<CovidService>();

  CovidHistorico get atual => _covidService.historico.first;

  List<KeyValue> get covidPorCidade {
    return _covidService.covidPorCidade
        .map((caso) => KeyValue(key: caso.cidade, value: caso.casosTotais))
        .toList();
  }

  List<KeyValue> get covidPorFaixaEtaria {
    return _covidService.covidPorFaixaEtaria
        .map((caso) => KeyValue(key: caso.faixa, value: caso.casosTotais))
        .toList();
  }

  List<KeyValue> get historicoPorDia {
    return _covidService.historico
        .map((caso) => KeyValue(key: caso.data, value: caso.casosTotais))
        .toList();
  }

  getData(DateTime data) async {
    setState(ViewState.Busy);
    await _covidService.getHistoricoDeCovid();
    await _covidService.getCovidPorCidade(data);
    await _covidService.getCovidPorFaixaEtaria(data);
    setState(ViewState.Idle);
  }
}
