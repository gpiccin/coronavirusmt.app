import 'package:covidmt/core/services/api.dart';
import 'package:covidmt/core/services/boletim_lista_service.dart';
import 'package:covidmt/core/services/boletim_service.dart';
import 'package:covidmt/core/viewmodels/covid/boletim_lista_view_model.dart';
import 'package:covidmt/core/viewmodels/covid/indicadores_view_model.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  // locator.registerLazySingleton(() => AuthenticationService());
  // locator.registerLazySingleton(() => PostService());
  locator.registerLazySingleton(() => Api());
  locator.registerLazySingleton(() => BoletimService());
  locator.registerLazySingleton(() => BoletimListaService());

  // locator.registerLazySingleton(() => LoginModel());
  locator.registerFactory(() => IndicadoresViewModel());
  locator.registerFactory(() => BoletimListaViewModel());
  // locator.registerFactory(() => LikeButtonModel());
  // locator.registerFactory(() => CommentsModel());
}
