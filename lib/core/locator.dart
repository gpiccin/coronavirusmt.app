import 'package:covidmt/core/service/api.dart';
import 'package:covidmt/core/service/boletins_service.dart';
import 'package:covidmt/core/service/boletim_service.dart';
import 'package:covidmt/core/service/obitos_service.dart';
import 'package:covidmt/core/viewmodel/covid/boletins_view_model.dart';
import 'package:covidmt/core/viewmodel/covid/indicadores_view_model.dart';
import 'package:covidmt/core/viewmodel/covid/obitos_view_model.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  // locator.registerLazySingleton(() => AuthenticationService());
  // locator.registerLazySingleton(() => PostService());
  locator.registerLazySingleton(() => Api());
  locator.registerLazySingleton(() => BoletimService());
  locator.registerLazySingleton(() => BoletinsService());
  locator.registerLazySingleton(() => ObitosService());

  // locator.registerLazySingleton(() => LoginModel());
  locator.registerFactory(() => IndicadoresViewModel());
  locator.registerFactory(() => BoletinsViewModel());
  locator.registerFactory(() => ObitosViewModel());
  // locator.registerFactory(() => CommentsModel());
}
