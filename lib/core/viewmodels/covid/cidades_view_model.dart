import 'package:coronavirusmt/core/enum/viewstate.dart';
import 'package:coronavirusmt/core/locator.dart';
import 'package:coronavirusmt/core/models/covid_cidades_casos_x_ativos.dart';
import 'package:coronavirusmt/core/models/covid_por_cidade.dart';
import 'package:coronavirusmt/core/services/covid_service.dart';
import 'package:coronavirusmt/core/viewmodels/shared/base_view_model.dart';

class CidadesViewModel extends BaseViewModel {
  CovidService _covidService = locator<CovidService>();
  DateTime _dataDoUltimoBoletim;

  Future<DateTime> get dataDoUltimoBoletim async {
    if (_dataDoUltimoBoletim == null) {
      _dataDoUltimoBoletim = await _covidService.getDataDoUltimoBoletim();
    }

    return _dataDoUltimoBoletim;
  }

  CovidCidadesCasosXAtivos _covidCidadesCasosXAtivos;
  CovidCidadesCasosXAtivos get totais => _covidCidadesCasosXAtivos;

  Future<List<CovidPorCidade>> getCovidPorCidade(
      int pageSize, int pageIndex) async {
    return _covidService.getCovidPorCidade(
        await dataDoUltimoBoletim, pageSize * pageIndex, pageSize);
  }

  loadData() async {
    setState(ViewState.Busy);
    _covidCidadesCasosXAtivos =
        await _covidService.getCidadesCasosXAtivos(await dataDoUltimoBoletim);
    setState(ViewState.Idle);
  }
}
