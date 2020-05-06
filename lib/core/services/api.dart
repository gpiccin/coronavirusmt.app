import 'package:coronavirusmt/core/constants.dart';
import 'package:coronavirusmt/core/models/boletim_lista.dart';
import 'package:coronavirusmt/core/models/boletim.dart';
import 'package:coronavirusmt/core/models/covid_cidades_casos_x_ativos.dart';
import 'package:coronavirusmt/core/models/covid_historico.dart';
import 'package:coronavirusmt/core/models/covid_por_cidade.dart';
import 'package:coronavirusmt/core/models/covid_por_faixa_etaria.dart';
import 'package:coronavirusmt/core/models/covid_por_tipo_de_leito.dart';
import 'package:coronavirusmt/core/models/noticia.dart';
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
          "query{ boletims(sort:\"data:desc\", limit: 45){  data  srag_casos_total  srag_casos_novos  covid_casos_total }}"
    });

    var historico = response.data["data"]["boletims"]
        .map((boletim) => SragHistorico.fromJson(boletim))
        .toList();

    return List<SragHistorico>.from(historico);
  }

  Future<List<Noticia>> getNoticias(int start, int limit) async {
    Response response = await client.post(Constants.GRAPHQL_PATH, data: {
      "query":
          "\n  \nquery {\n  noticias(sort: \"data:desc,id:desc\", start: $start, limit: $limit) {\n    titulo \n    descricao\n    url\n    imagem_url\n    data\n    fonte_de_noticia {nome}\n  }\n}"
    });

    var noticias = response.data["data"]["noticias"]
        .map((noticia) => Noticia.fromJson(noticia))
        .toList();

    return List<Noticia>.from(noticias);
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

  Future<List<BoletimLista>> getBoletins(int start, int limit) async {
    Response response = await client.post(Constants.GRAPHQL_PATH, data: {
      "query":
          "query { boletims(sort: \"data:desc\", start: $start, limit: $limit) {  data  referencia  link  covid_casos_total  covid_casos_novos}}"
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

  Future<List<CovidPorCidade>> getCovidPorCidade(
      DateTime data, int start, int limit) async {
    Response response = await client.post(Constants.GRAPHQL_PATH, data: {
      "query":
          "query { casosPorCidades(where: {data:\"${this._dateParam(data)}\"}, start: $start, limit: $limit, sort: \"covid_casos_total:desc,id:asc\") {  covid_casos_total  covid_casos covid_obitos covid_recuperados cidade {nome} } boletims(where: {data:\"${this._dateParam(data)}\"}) {\n    covid_casos_total\n  }}"
    });

    int covidTotal = response.data["data"]["boletims"][0]['covid_casos_total'];
    var casosPorCidade = response.data["data"]["casosPorCidades"]
        .map((cidade) => CovidPorCidade.fromJson(cidade, covidTotal))
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

  Future<DateTime> getDataDoUltimoBoletim() async {
    Response response = await client.post(Constants.GRAPHQL_PATH, data: {
      "query": "query { boletims(limit: 1, sort: \"data:desc\") { data }}"
    });

    return DateTime.parse(response.data['data']['boletims'][0]['data']);
  }

  Future<CovidCidadesCasosXAtivos> getCidadesCasosXAtivos(DateTime data) async {
    Response response = await client.post(Constants.GRAPHQL_PATH, data: {
      "query":
          "query { \n  casos: casosPorCidadesConnection(limit: 1, where: {data:\"${this._dateParam(data)}\"}, \n  sort: \"data:desc\") { aggregate {count} }\n\n  ativos: casosPorCidadesConnection(limit: 1, where: {data:\"${this._dateParam(data)}\", covid_casos_gt: 0}, \n  sort: \"data:desc\") { aggregate {count} }\n obitos: casosPorCidadesConnection(limit: 1, where: {data:\"${this._dateParam(data)}\", covid_obitos_gt: 0}, \n  sort: \"data:desc\") { aggregate {count} }}"
    });

    return CovidCidadesCasosXAtivos.fromMap(response.data['data']);
  }
}
