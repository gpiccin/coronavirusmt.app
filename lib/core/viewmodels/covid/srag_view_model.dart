import 'package:coronavirusmt/core/enum/viewstate.dart';
import 'package:coronavirusmt/core/locator.dart';
import 'package:coronavirusmt/core/models/key_value.dart';
import 'package:coronavirusmt/core/models/srag_historico.dart';
import 'package:coronavirusmt/core/services/srag_service.dart';
import 'package:coronavirusmt/core/viewmodels/shared/base_view_model.dart';

class SragViewModel extends BaseViewModel {
  SragService _sragService = locator<SragService>();

  SragHistorico get atual => _sragService.historico.first;

  List<KeyValue> get historicoPorDia {
    return _sragService.historico
        .map((caso) => KeyValue(key: caso.data, value: caso.casosTotais))
        .toList();
  }

  loadData() async {
    setState(ViewState.Busy);
    await _sragService.getHistoricoDeSrag();
    setState(ViewState.Idle);
  }
}
