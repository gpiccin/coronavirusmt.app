import 'package:covidmt/core/services/api.dart';

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Recupera e converte o boletim 37', () async {
    var boletim = await Api().getBoletim("37");

    expect(boletim.referencia, "37");
    expect(boletim.data, DateTime.parse("2020-04-14"));
    expect(boletim.link, "http://www.saude.mt.gov.br/arquivo/10932");

    expect(boletim.sragCasos, 537);
    expect(boletim.sragNovos, 21);

    expect(boletim.covidCasos, 138);
    expect(boletim.covidNovos, 4);

    expect(boletim.covidHospitalizados, 6);
    expect(boletim.covidNovosHospitalizados, -2);
    expect(boletim.covidPercentualDeHospitalizados, 4);

    expect(boletim.covidRecuperados, 31);
    expect(boletim.covidNovosRecuperados, 14);
    expect(boletim.covidPercentualDeRecuperados, 22);

    expect(boletim.covidObitos, 4);
    expect(boletim.covidNovosObitos, 0);
    expect(boletim.covidPercentualDeObitos, 3);

    expect(boletim.covidIsolamento, 97);
    expect(boletim.covidNovosEmIsolamento, -8);
    expect(boletim.covidPercentualEmIsolamento, 70);
  });

  test('Recupera a lista de boletins', () async {
    var boletins = await Api().getBoletins();
    expect(boletins.length > 0, true);
  });
}
