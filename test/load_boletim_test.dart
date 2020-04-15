import 'package:covidmt/shared/repository/app_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Recupera e converte o boletim 37', () async {
    var boletim = await AppRepository.getBoletim("37");

    expect(boletim.referencia, "37");
    expect(boletim.data, DateTime.parse("2020-04-14"));
    expect(boletim.sragCasos, 537);
    expect(boletim.covidCasos, 138);
    expect(boletim.covidHospitalizados, 6);
    expect(boletim.covidRecuperados, 31);
    expect(boletim.covidObitos, 4);
  });
}
