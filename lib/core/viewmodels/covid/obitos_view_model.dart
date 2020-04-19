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

  int get totalDeObitos => obitos.length;

  List<KeyValue> get obitosAcumuladosPorDia {
    var grupoPorDia = groupBy(obitos, (obito) => obito.data).entries.toList();

    grupoPorDia.sort((a, b) => a.value[0].data.compareTo(b.value[0].data));

    var keyValues = grupoPorDia
        .map((obitos) => KeyValue(key: obitos.key, value: obitos.value.length))
        .toList();

    for (var i = 0; i < keyValues.length; i++) {
      if (i == 0) continue;

      keyValues[i].value += keyValues[i - 1].value;
    }

    return keyValues;
  }

  List<KeyValue> get obitosPorComorbidade {
    var grupoPorComorbidade =
        groupBy(obitos, (obito) => obito.comorbidade).entries.toList();

    grupoPorComorbidade
        .sort((a, b) => b.value.length.compareTo(a.value.length));

    return grupoPorComorbidade
        .map((obitos) => KeyValue(key: obitos.key, value: obitos.value.length))
        .toList();
  }

  List<KeyValue> get obitosPorSexo {
    var grupoPorSexo = groupBy(obitos, (obito) => obito.sexo).entries.toList();

    grupoPorSexo.sort((a, b) => b.value.length.compareTo(a.value.length));

    return grupoPorSexo
        .map((obitos) => KeyValue(key: obitos.key, value: obitos.value.length))
        .toList();
  }

  List<KeyValue> get obitosPorCidade {
    var grupoPorCidade =
        groupBy(obitos, (obito) => obito.cidade).entries.toList();

    grupoPorCidade.sort((a, b) => b.value.length.compareTo(a.value.length));

    return grupoPorCidade
        .map((obitos) => KeyValue(key: obitos.key, value: obitos.value.length))
        .toList();
  }

  List<KeyValue> get obitosPorFaixaEtaria {
    var grupoPorFaixaEtaria =
        groupBy(obitos, (obito) => obito.faixaEtaria.toString())
            .entries
            .toList();

    grupoPorFaixaEtaria.sort((a, b) =>
        a.value[0].ordemDaFaixaEtaria.compareTo(b.value[0].ordemDaFaixaEtaria));

    return grupoPorFaixaEtaria
        .map((obitos) => KeyValue(key: obitos.key, value: obitos.value.length))
        .toList();
  }

  getObitos() async {
    setState(ViewState.Busy);
    await _obitoService.getObitos();
    setState(ViewState.Idle);
  }
}
