import 'package:covidmt/core/models/boletim_lista_model.dart';
import 'package:covidmt/core/models/boletim_model.dart';
import 'package:covidmt/core/models/obito_model.dart';
import 'package:dio/dio.dart';
import '../constants.dart';

class Api {
  var client = Dio(BaseOptions(baseUrl: Constants.BASE_URL_PATH));

  Future<dynamic> getDadosSars() async {
    Response response = await client.post(Constants.GRAPHQL_PATH, data: {
      "query":
          "query{\n  boletims(sort:\"data:asc\", limit: 67){\n    data\n    srag_casos_total\n    srag_casos_novos\n    \n  }\n}"
    });
    await Future.delayed(Duration(milliseconds: 200));
    var itens = response.data["data"]["boletims"];

    return itens;
  }

  Future<dynamic> getUltimoRegistroDadosSars() async {
    Response response = await client.post(Constants.GRAPHQL_PATH, data: {
      "query":
          "query{\n  boletims(sort:\"data:desc\", limit: 1){\n    data\n    srag_casos_total\n    srag_casos_novos\n    \n  }\n}"
    });

    await Future.delayed(Duration(milliseconds: 200));
    var itens = response.data["data"]["boletims"];

    return itens;
  }

  Future<List<Obito>> getObitos() async {
    Response response = await client.post(Constants.GRAPHQL_PATH, data: {
      "query":
          "query {\n  obitos(sort: \"data:desc\") {\n    data\n    idade\n    cidade {nome}\n    faixaEtaria: faixa_etaria {\n      faixa\n      ordem\n    }\n    sexo {valor}\n    comorbidade\n  }\n}"
    });

    var obitos = response.data["data"]["obitos"]
        .map((obito) => Obito.fromJson(obito))
        .toList();

    return List<Obito>.from(obitos);
  }

  Future<BoletimModel> getBoletim(String referencia) async {
    Response response = await client.get(Constants.BOLETINS_PATH,
        queryParameters: {"referencia": referencia});

    return BoletimModel.fromJson(response.data[0]);
  }

  Future<List<BoletimLista>> getBoletins() async {
    Response response = await client.post(Constants.GRAPHQL_PATH, data: {
      "query":
          "query {\n  boletims(sort: \"data:desc\") {\n    data\n    referencia\n    link\n  }\n}"
    });

    var boletins = response.data["data"]["boletims"]
        .map((boletim) => BoletimLista.fromJson(boletim))
        .toList();

    return List<BoletimLista>.from(boletins);
  }

  Future<BoletimModel> getUltimoBoletim() async {
    Response response = await client.get(Constants.BOLETINS_PATH,
        queryParameters: {"_limit": 1, "_sort": "data:DESC"});

    return BoletimModel.fromJson(response.data[0]);
  }
}
