import 'package:covidmt/model/tipo_doenca.dart';
import 'package:covidmt/model/tipo_registro.dart';

class Boletim {
  int numeroBoletim;
  DateTime dataRegistro;
  int tipoDoenca;
  int qtdCasos;
  String cidade;
  int tipoRegistro;

  Boletim(
      {this.numeroBoletim,
      this.dataRegistro,
      this.tipoDoenca,
      this.qtdCasos,
      this.cidade,
      this.tipoRegistro});
}
