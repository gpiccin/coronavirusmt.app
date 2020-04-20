import 'package:coronavirusmt/core/services/api.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Recupera e converte o boletim 37', () async {
    var lista = await Api().getDadosSars();
    expect(lista.length, 14);
  });
}
