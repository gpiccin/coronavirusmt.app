import 'package:coronavirusmt/core/services/api.dart';
import 'package:coronavirusmt/core/services/boletins_service.dart';
import 'package:coronavirusmt/core/services/boletim_service.dart';
import 'package:coronavirusmt/core/services/covid_service.dart';
import 'package:coronavirusmt/core/services/noticias_service.dart';
import 'package:coronavirusmt/core/services/obitos_service.dart';
import 'package:coronavirusmt/core/services/srag_service.dart';
import 'package:coronavirusmt/core/viewmodels/covid/boletins_view_model.dart';
import 'package:coronavirusmt/core/viewmodels/covid/cidades_view_model.dart';
import 'package:coronavirusmt/core/viewmodels/covid/confirmados_view_model.dart';
import 'package:coronavirusmt/core/viewmodels/covid/hospitalizados_view_model.dart';
import 'package:coronavirusmt/core/viewmodels/covid/indicadores_view_model.dart';
import 'package:coronavirusmt/core/viewmodels/covid/isolamento_view_model.dart';
import 'package:coronavirusmt/core/viewmodels/covid/obitos_view_model.dart';
import 'package:coronavirusmt/core/viewmodels/covid/recuperados_view_model.dart';
import 'package:coronavirusmt/core/viewmodels/covid/srag_view_model.dart';
import 'package:coronavirusmt/core/viewmodels/noticias/noticias_view_model.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => Api());
  locator.registerLazySingleton(() => BoletimService());
  locator.registerLazySingleton(() => BoletinsService());
  locator.registerLazySingleton(() => ObitosService());
  locator.registerLazySingleton(() => CovidService());
  locator.registerLazySingleton(() => SragService());
  locator.registerLazySingleton(() => NoticiasService());

  locator.registerFactory(() => RecuperadosViewModel());
  locator.registerFactory(() => IsolamentoViewModel());
  locator.registerFactory(() => IndicadoresViewModel());
  locator.registerFactory(() => BoletinsViewModel());
  locator.registerFactory(() => ObitosViewModel());
  locator.registerFactory(() => ConfirmadosViewModel());
  locator.registerFactory(() => HospitalizadosViewModel());
  locator.registerFactory(() => SragViewModel());
  locator.registerFactory(() => NoticiasViewModel());
  locator.registerFactory(() => CidadesViewModel());
}
