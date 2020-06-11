import 'package:coronavirusmt/core/enum/viewstate.dart';
import 'package:coronavirusmt/core/locator.dart';
import 'package:coronavirusmt/core/models/covid_confirmado_historico.dart';
import 'package:coronavirusmt/core/models/covid_por_faixa_etaria.dart';
import 'package:coronavirusmt/core/models/key_value.dart';
import 'package:coronavirusmt/core/services/covid_service.dart';
import 'package:coronavirusmt/core/viewmodels/shared/base_view_model.dart';

class ConfirmadosViewModel extends BaseViewModel {
  List<CovidConfirmadoHistorico> _historico;
  List<CovidPorFaixaEtaria> _covidPorFaixaEtaria;

  CovidConfirmadoHistorico get atual => _historico.first;

  List<KeyValue> get covidPorFaixaEtaria {
    var result = _covidPorFaixaEtaria
        .map((caso) => KeyValue(
            key: caso.faixa,
            value: caso.casosTotais,
            tag: caso.ordemDaFaixaEtaria))
        .toList();

    result.sort((a, b) => b.tag.compareTo(a.tag));

    return result;
  }

  List<KeyValue> get acumulativoPorDia {
    var result = _historico
        .map((caso) => KeyValue(key: caso.data, value: caso.casosTotais))
        .toList();

    result.sort((a, b) => a.key.compareTo(b.key));

    return result;
  }

  List<KeyValue> get casosNovosPorDia {
    var result = _historico
        .map((caso) => KeyValue(key: caso.data, value: caso.casos))
        .toList();

    result.sort((a, b) => a.key.compareTo(b.key));

    return result;
  }

  loadData(DateTime data) async {
    setState(ViewState.Busy);

    CovidService covidService = locator<CovidService>();

    _historico = await covidService.getCasosConfirmadosDeCovidHistorico();
    _covidPorFaixaEtaria = await covidService.getCovidPorFaixaEtaria(data);

    setState(ViewState.Idle);
  }
}
