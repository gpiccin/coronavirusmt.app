import 'package:covidmt/model/boletim_model.dart';
import 'package:covidmt/model/srars_model.dart';
import 'package:covidmt/shared/repository/utils/constants.dart';
import 'package:dio/dio.dart';

class AppRepository {
  static Future<List<SrasModel>> getDadosBoletim() async {
    var client = Dio(BaseOptions(baseUrl: Constants.URL_KEYCOVIDMT));

    Response response = await client.post(Constants.KEY_COVIDMT, data: {
      "query":
          "query {\n  boletims(limit: 1, sort:\"data:desc\") {\n    data\n    srag_casos_total\n    covid_casos_total\n  }\nsummary: boletimsConnection {\n    aggregate {\n      count\n      avg {\n        srag_casos_novos\n        covid_casos_novos\n      }\n    }\n  }\n}"
    });
    var itens = response.data;

    List<SrasModel> lista_boletim_sars = [];
    for (int i = 0; i < itens.length; i++) {
      SrasModel srars = SrasModel.fromJson(itens[i]);
      lista_boletim_sars.add(srars);
    }

    return lista_boletim_sars;
  }

  static Future<BoletimModel> getBoletim(String referencia) async {
    var client = Dio(BaseOptions(baseUrl: Constants.URL_KEYCOVIDMT));

    Response response = await client.get(Constants.BOLETINS_PATH_COVIDMT,
        queryParameters: {"referencia": referencia});

    return BoletimModel.fromJson(response.data[0]);
  }
}
