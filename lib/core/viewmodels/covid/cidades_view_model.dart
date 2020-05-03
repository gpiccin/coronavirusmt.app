import 'package:coronavirusmt/core/enum/viewstate.dart';
import 'package:coronavirusmt/core/locator.dart';
import 'package:coronavirusmt/core/models/covid_cidades_casos_x_ativos.dart';
import 'package:coronavirusmt/core/models/covid_por_cidade.dart';
import 'package:coronavirusmt/core/services/boletim_local_service.dart';
import 'package:coronavirusmt/core/services/covid_service.dart';
import 'package:coronavirusmt/core/viewmodels/shared/base_view_model.dart';

class CidadesViewModel extends BaseViewModel {
  CovidService _covidService = locator<CovidService>();

  CovidCidadesCasosXAtivos _covidCidadesCasosXAtivos;
  CovidCidadesCasosXAtivos get totais => _covidCidadesCasosXAtivos;

  Future<List<CovidPorCidade>> getCovidPorCidade(
      int pageSize, int pageIndex) async {
    return _covidService.getCovidPorCidade(
        BoletimLocalService.getData(await BoletimLocalService.box()),
        pageSize * pageIndex,
        pageSize);
  }

  loadData() async {
    setState(ViewState.Busy);
    _covidCidadesCasosXAtivos = await _covidService.getCidadesCasosXAtivos(
        BoletimLocalService.getData(await BoletimLocalService.box()));
    setState(ViewState.Idle);
  }
}
