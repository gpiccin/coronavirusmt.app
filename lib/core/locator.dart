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
import 'package:coronavirusmt/core/viewmodels/covid/data_boletim_view_model.dart';
import 'package:coronavirusmt/core/viewmodels/covid/hospitalizados_view_model.dart';
import 'package:coronavirusmt/core/viewmodels/covid/indicadores_view_model.dart';
import 'package:coronavirusmt/core/viewmodels/covid/obitos_view_model.dart';
import 'package:coronavirusmt/core/viewmodels/covid/srag_view_model.dart';
import 'package:coronavirusmt/core/viewmodels/noticias/noticias_view_model.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  // locator.registerLazySingleton(() => AuthenticationService());
  // locator.registerLazySingleton(() => PostService());
  locator.registerLazySingleton(() => Api());
  locator.registerLazySingleton(() => BoletimService());
  locator.registerLazySingleton(() => BoletinsService());
  locator.registerLazySingleton(() => ObitosService());
  locator.registerLazySingleton(() => CovidService());
  locator.registerLazySingleton(() => SragService());
  locator.registerLazySingleton(() => NoticiasService());

  // locator.registerLazySingleton(() => LoginModel());
  locator.registerFactory(() => IndicadoresViewModel());
  locator.registerFactory(() => BoletinsViewModel());
  locator.registerFactory(() => ObitosViewModel());
  locator.registerFactory(() => ConfirmadosViewModel());
  locator.registerFactory(() => HospitalizadosViewModel());
  locator.registerFactory(() => SragViewModel());
  locator.registerFactory(() => NoticiasViewModel());
  locator.registerFactory(() => CidadesViewModel());
  locator.registerLazySingleton(() => DataBoletimViewModel());
  // locator.registerFactory(() => CommentsModel());
}
