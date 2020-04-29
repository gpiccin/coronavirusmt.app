import 'package:coronavirusmt/core/models/noticia.dart';
import 'package:coronavirusmt/ui/shared/ui_helpers.dart';
import 'package:coronavirusmt/ui/shared/ui_style.dart';
import 'package:coronavirusmt/ui/shared/ui_typography.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NoticiaCard extends StatelessWidget {
  final Noticia noticia;

  NoticiaCard({this.noticia});

  _launchBoletimURL(noticiaUrl) async {
    if (await canLaunch(noticiaUrl)) {
      await launch(noticiaUrl);
    } else {
      throw 'Não foi possível abrir a notícia';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        onTap: () => this._launchBoletimURL(noticia.url),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            boxShadow: <BoxShadow>[
              new BoxShadow(
                color: Colors.grey[300],
                blurRadius: 4.0,
                offset: new Offset(0.0, 0.0),
              ),
            ],
          ),
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(UIStyle.padding),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Image.network(noticia.imagemUrl,
                        height: 100, width: 100, fit: BoxFit.fitHeight)),
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        noticia.titulo,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Fonte: ${noticia.fonteDaNoticia} - ${UIHelper.fomartDateDMY(noticia.data)}.',
                        style: UITypography.overline,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
