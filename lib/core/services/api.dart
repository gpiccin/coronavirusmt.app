import 'package:coronavirusmt/core/constants.dart';
import 'package:coronavirusmt/core/models/boletim_lista.dart';
import 'package:coronavirusmt/core/models/boletim.dart';
import 'package:coronavirusmt/core/models/covid_historico.dart';
import 'package:coronavirusmt/core/models/covid_por_cidade.dart';
import 'package:coronavirusmt/core/models/covid_por_faixa_etaria.dart';
import 'package:coronavirusmt/core/models/covid_por_tipo_de_leito.dart';
import 'package:coronavirusmt/core/models/obito.dart';
import 'package:coronavirusmt/core/models/srag_historico.dart';
import 'package:dio/dio.dart';

class Api {
  var client = Dio(BaseOptions(baseUrl: Constants.BASE_URL_PATH));

  String _dateParam(DateTime data) {
    return '${data.year}-${data.month.toString().padLeft(2, '0')}-${data.day.toString().padLeft(2, '0')}';
  }

  Future<List<SragHistorico>> getHistoricoDeSrag() async {
    Response response = await client.post(Constants.GRAPHQL_PATH, data: {
      "query":
          "query{\n  boletims(sort:\"data:desc\", limit: 67){\n    data\n    srag_casos_total\n    srag_casos_novos\n    covid_casos_total\n  }\n}"
    });

    var historico = response.data["data"]["boletims"]
        .map((boletim) => SragHistorico.fromJson(boletim))
        .toList();

    return List<SragHistorico>.from(historico);
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

  Future<List<CovidHistorico>> getHistoricoDeCovid() async {
    Response response = await client.post(Constants.GRAPHQL_PATH, data: {
      "query":
          "query {\n  boletims(sort: \"data:desc\") {\n    data\n    covid_casos_total\n    covid_casos_novos\n  }\n}"
    });

    var historico = response.data["data"]["boletims"]
        .map((boletim) => CovidHistorico.fromJson(boletim))
        .toList();

    return List<CovidHistorico>.from(historico);
  }

  Future<List<CovidPorCidade>> getCovidPorCidade(DateTime data) async {
    Response response = await client.post(Constants.GRAPHQL_PATH, data: {
      "query":
          "query {\n  casosPorCidades(where: {data:\"${this._dateParam(data)}\"}, sort: \"covid_casos_total:desc\") {\n    covid_casos_total\n    cidade {nome}\n  }\n}"
    });

    var casosPorCidade = response.data["data"]["casosPorCidades"]
        .map((cidade) => CovidPorCidade.fromJson(cidade))
        .toList();

    return List<CovidPorCidade>.from(casosPorCidade);
  }

  Future<List<CovidPorFaixaEtaria>> getCovidPorFaixaEtaria(
      DateTime data) async {
    Response response = await client.post(Constants.GRAPHQL_PATH, data: {
      "query":
          "query {\n  casosPorFaixaEtarias(where: {data:\"${this._dateParam(data)}\"}) {\n    covid_casos_total\n    faixa_etaria {faixa ordem}\n  }\n}"
    });

    var casosPorFaixaEtaria = response.data["data"]["casosPorFaixaEtarias"]
        .map((faixa) => CovidPorFaixaEtaria.fromJson(faixa))
        .toList();

    return List<CovidPorFaixaEtaria>.from(casosPorFaixaEtaria);
  }

  Future<List<CovidPorTipoDeLeito>> getCovidPorTipoDeLeito(
      DateTime data) async {
    Response response = await client.post(Constants.GRAPHQL_PATH, data: {
      "query":
          "query {\n  casosPorTipoDeLeitos(where: {data:\"${this._dateParam(data)}\"}) {\n    covid_casos_total\n    leito { valor }\n    rede { valor }\n  }\n}"
    });

    var casosPorTipoDeLeito = response.data["data"]["casosPorTipoDeLeitos"]
        .map((caso) => CovidPorTipoDeLeito.fromJson(caso))
        .toList();

    return List<CovidPorTipoDeLeito>.from(casosPorTipoDeLeito);
  }

  Future<Boletim> getBoletim(String referencia) async {
    Response response = await client.get(Constants.BOLETINS_PATH,
        queryParameters: {"referencia": referencia});

    return Boletim.fromJson(response.data[0]);
  }

  Future<Boletim> getUltimoBoletim() async {
    Response response = await client.get(Constants.BOLETINS_PATH,
        queryParameters: {"_limit": 1, "_sort": "data:DESC"});

    return Boletim.fromJson(response.data[0]);
  }
}
