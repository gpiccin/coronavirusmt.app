import 'package:coronavirusmt/core/locator.dart';
import 'package:coronavirusmt/core/services/noticias_service.dart';
import 'package:coronavirusmt/core/viewmodels/shared/base_view_model.dart';

class NoticiasViewModel extends BaseViewModel {
  NoticiasService _noticiasService = locator<NoticiasService>();

  getNoticias(int pageSize, int pageIndex) {
    return _noticiasService.getNoticias(pageSize * pageIndex, pageSize);
  }
}
