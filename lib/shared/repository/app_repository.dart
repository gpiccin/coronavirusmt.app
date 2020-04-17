import 'package:covidmt/model/boletim_model.dart';
import 'package:covidmt/model/srars_model.dart';
import 'package:covidmt/shared/repository/utils/constants.dart';
import 'package:dio/dio.dart';

class AppRepository {
  static Future<dynamic> getDadosSars() async {
    var client = Dio(BaseOptions(baseUrl: Constants.URL_KEYCOVIDMT));

    Response response = await client.post(Constants.KEY_COVIDMT, data: {
      "query":
          "query{\n  boletims(sort:\"data:asc\", limit: 67){\n    data\n    srag_casos_total\n    srag_casos_novos\n    \n  }\n}"
    });
    await Future.delayed(Duration(milliseconds: 200));
    var itens = response.data["data"]["boletims"];

    return itens;
  }

  static Future<dynamic> getUltimoRegistroDadosSars() async {
    var client = Dio(BaseOptions(baseUrl: Constants.URL_KEYCOVIDMT));

    Response response = await client.post(Constants.KEY_COVIDMT, data: {
      "query":
          "query{\n  boletims(sort:\"data:desc\", limit: 1){\n    data\n    srag_casos_total\n    srag_casos_novos\n    \n  }\n}"
    });
    await Future.delayed(Duration(milliseconds: 200));
    var itens = response.data["data"]["boletims"];

    return itens;
  }

  static Future<BoletimModel> getBoletim(String referencia) async {
    var client = Dio(BaseOptions(baseUrl: Constants.URL_KEYCOVIDMT));

    Response response = await client.get(Constants.BOLETINS_PATH_COVIDMT,
        queryParameters: {"referencia": referencia});

    return BoletimModel.fromJson(response.data[0]);
  }
}
