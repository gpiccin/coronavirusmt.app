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
          "query{ boletims(sort:\"data:desc\", limit: 67){  data  srag_casos_total  srag_casos_novos  covid_casos_total }}"
    });

    var historico = response.data["data"]["boletims"]
        .map((boletim) => SragHistorico.fromJson(boletim))
        .toList();

    return List<SragHistorico>.from(historico);
  }

  Future<List<Obito>> getObitos() async {
    Response response = await client.post(Constants.GRAPHQL_PATH, data: {
      "query":
          "query { obitos(sort: \"data:desc\") {  data  idade  cidade {nome}  faixaEtaria: faixa_etaria {   faixa   ordem  }  sexo {valor}  comorbidade }}"
    });

    var obitos = response.data["data"]["obitos"]
        .map((obito) => Obito.fromJson(obito))
        .toList();

    return List<Obito>.from(obitos);
  }

  Future<List<BoletimLista>> getBoletins() async {
    Response response = await client.post(Constants.GRAPHQL_PATH, data: {
      "query":
          "query { boletims(sort: \"data:desc\") {  data  referencia  link  covid_casos_total  covid_casos_novos}}"
    });

    var boletins = response.data["data"]["boletims"]
        .map((boletim) => BoletimLista.fromJson(boletim))
        .toList();

    return List<BoletimLista>.from(boletins);
  }

  Future<List<CovidHistorico>> getHistoricoDeCovid() async {
    Response response = await client.post(Constants.GRAPHQL_PATH, data: {
      "query":
          "query { boletims(sort: \"data:desc\") {  data  covid_casos_total  covid_casos_novos covid_media_de_idade}}"
    });

    var historico = response.data["data"]["boletims"]
        .map((boletim) => CovidHistorico.fromJson(boletim))
        .toList();

    return List<CovidHistorico>.from(historico);
  }

  Future<List<CovidPorCidade>> getCovidPorCidade(DateTime data) async {
    Response response = await client.post(Constants.GRAPHQL_PATH, data: {
      "query":
          "query { casosPorCidades(where: {data:\"${this._dateParam(data)}\"}, sort: \"covid_casos_total:desc\") {  covid_casos_total  cidade {nome} }}"
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
          "query { casosPorFaixaEtarias(where: {data:\"${this._dateParam(data)}\"}) {  covid_casos_total  faixa_etaria {faixa ordem} }}"
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
          "query { casosPorTipoDeLeitos(where: {data:\"${this._dateParam(data)}\"}) {  covid_casos_total  leito { valor }  rede { valor } }}"
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
