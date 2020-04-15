import 'package:covidmt/model/boletim.dart';
import 'package:covidmt/shared/repository/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class AppRepositoriy {
  static Future<Boletim> getDadosBoletim() async {
    var client = Dio(BaseOptions(baseUrl: Constants.URL_KEYCOVIDMT));

    Response response = await client.post(Constants.KEY_COVIDMT, data: {
      "query":
          "query {\n  boletims(limit: 1, sort:\"data:desc\") {\n    data\n    srag_casos_total\n    covid_casos_total\n  }\nsummary: boletimsConnection {\n    aggregate {\n      count\n      avg {\n        srag_casos_novos\n        covid_casos_novos\n      }\n    }\n  }\n}"
    });

    print(response);
  }
}
