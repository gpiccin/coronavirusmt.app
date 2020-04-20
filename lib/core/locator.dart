import 'package:coronavirusmt/core/services/api.dart';
import 'package:coronavirusmt/core/services/boletins_service.dart';
import 'package:coronavirusmt/core/services/boletim_service.dart';
import 'package:coronavirusmt/core/services/covid_service.dart';
import 'package:coronavirusmt/core/services/obitos_service.dart';
import 'package:coronavirusmt/core/viewmodels/covid/boletins_view_model.dart';
import 'package:coronavirusmt/core/viewmodels/covid/confirmados_view_model.dart';
import 'package:coronavirusmt/core/viewmodels/covid/hospitalizados_view_model.dart';
import 'package:coronavirusmt/core/viewmodels/covid/indicadores_view_model.dart';
import 'package:coronavirusmt/core/viewmodels/covid/obitos_view_model.dart';
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

  // locator.registerLazySingleton(() => LoginModel());
  locator.registerFactory(() => IndicadoresViewModel());
  locator.registerFactory(() => BoletinsViewModel());
  locator.registerFactory(() => ObitosViewModel());
  locator.registerFactory(() => ConfirmadosViewModel());
  locator.registerFactory(() => HospitalizadosViewModel());
  // locator.registerFactory(() => CommentsModel());
}
