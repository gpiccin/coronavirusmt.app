import 'package:collection/collection.dart';
import 'package:covidmt/core/enum/viewstate.dart';
import 'package:covidmt/core/locator.dart';
import 'package:covidmt/core/model/key_value.dart';
import 'package:covidmt/core/model/obito_model.dart';
import 'package:covidmt/core/services/obitos_service.dart';
import 'package:covidmt/core/viewmodels/base_view_model.dart';

class ObitosViewModel extends BaseViewModel {
  ObitosService _obitoService = locator<ObitosService>();

  List<Obito> get obitos => _obitoService.obitos;

  int get mediaDeIdade =>
      obitos.map((m) => m.idade).reduce((a, b) => a + b) ~/ obitos.length;

  Map<String, List<Obito>> get obitosPorCidade =>
      groupBy(obitos, (obito) => obito.cidade);

  List<KeyValue> get obitosPorFaixaEtaria {
    var obitosPorFaixa =
        groupBy(obitos, (obito) => obito.faixaEtaria.toString())
            .entries
            .toList();

    obitosPorFaixa.sort((a, b) =>
        a.value[0].ordemDaFaixaEtaria.compareTo(b.value[0].ordemDaFaixaEtaria));

    return obitosPorFaixa
        .map((obitos) =>
            KeyValue(key: obitos.key, value: obitos.value.length.toDouble()))
        .toList();
  }

  getObitos() async {
    setState(ViewState.Busy);
    await _obitoService.getObitos();
    setState(ViewState.Idle);
  }
}
