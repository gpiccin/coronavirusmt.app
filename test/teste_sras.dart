import 'package:covidmt/shared/repository/app_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Recupera e converte o boletim 37', () async {
    var lista = await AppRepository.getDadosSars();
    expect(lista.length, 14);
  });
}
