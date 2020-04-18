import 'package:covidmt/core/model/boletim_lista_model.dart';
import 'package:covidmt/core/model/boletim_model.dart';
import 'package:dio/dio.dart';
import '../constants.dart';

class Api {
  var client = Dio(BaseOptions(baseUrl: Constants.URL_KEYCOVIDMT));

  Future<dynamic> getDadosSars() async {
    Response response = await client.post(Constants.KEY_COVIDMT, data: {
      "query":
          "query{\n  boletims(sort:\"data:asc\", limit: 67){\n    data\n    srag_casos_total\n    srag_casos_novos\n    \n  }\n}"
    });
    await Future.delayed(Duration(milliseconds: 200));
    var itens = response.data["data"]["boletims"];

    return itens;
  }

  Future<dynamic> getUltimoRegistroDadosSars() async {
    Response response = await client.post(Constants.KEY_COVIDMT, data: {
      "query":
          "query{\n  boletims(sort:\"data:desc\", limit: 1){\n    data\n    srag_casos_total\n    srag_casos_novos\n    \n  }\n}"
    });

    await Future.delayed(Duration(milliseconds: 200));
    var itens = response.data["data"]["boletims"];

    return itens;
  }

  Future<BoletimModel> getBoletim(String referencia) async {
    Response response = await client.get(Constants.BOLETINS_PATH_COVIDMT,
        queryParameters: {"referencia": referencia});

    return BoletimModel.fromJson(response.data[0]);
  }

  Future<List<BoletimLista>> getBoletins() async {
    Response response = await client.post(Constants.KEY_COVIDMT, data: {
      "query":
          "query {\n  boletims(sort: \"data:desc\") {\n    data\n    referencia\n    link\n  }\n}"
    });

    var itens = response.data["data"]["boletims"]
        .map((boletim) => BoletimLista.fromJson(boletim))
        .toList();

    return List<BoletimLista>.from(itens);
  }

  Future<BoletimModel> getUltimoBoletim() async {
    Response response = await client.get(Constants.BOLETINS_PATH_COVIDMT,
        queryParameters: {"_limit": 1, "_sort": "data:DESC"});

    return BoletimModel.fromJson(response.data[0]);
  }
}
