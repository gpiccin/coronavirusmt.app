import 'package:coronavirusmt/core/enum/viewstate.dart';
import 'package:coronavirusmt/core/models/boletim_lista.dart';
import 'package:coronavirusmt/core/viewmodels/covid/boletins_view_model.dart';
import 'package:coronavirusmt/ui/shared/base_view.dart';
import 'package:coronavirusmt/ui/shared/ui_typography.dart';
import 'package:coronavirusmt/ui/shared/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BoletinsView extends StatelessWidget {
  final double defaultPadding = 12.0;

  _launchBoletimURL(boletimUrl) async {
    if (await canLaunch(boletimUrl)) {
      await launch(boletimUrl);
    } else {
      throw 'Não foi possível abrir o boletim $boletimUrl';
    }
  }

  Widget _buildRow(BoletimLista boletim) {
    return ListTile(
      title: Text(
        "${UIHelper.fomartDateDMY(boletim.data)} - Boletim: ${boletim.referencia}",
        style: UITypography.title,
      ),
      subtitle: Text(
          "${boletim.casosTotais} casos confirmados, ${boletim.casosNovos} novos "),
      trailing: GestureDetector(
          child: Icon(Icons.launch, color: Colors.grey, size: 24.0),
          onTap: () {
            _launchBoletimURL(boletim.link);
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<BoletinsViewModel>(
        name: "Boletins",
        onModelReady: (model) => model.loadData(),
        builder:
            (BuildContext context, BoletinsViewModel model, Widget child) =>
                model.state == ViewState.Busy
                    ? UIHelper.loading()
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          UIHelper.headline("Boletins oficiais do governo",
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 20)),
                          Expanded(
                            child: ListView.builder(
                              itemCount: model.boletins.length,
                              padding: const EdgeInsets.all(0),
                              itemBuilder: (BuildContext context, int i) {
                                return _buildRow(model.boletins.elementAt(i));
                              },
                            ),
                          )
                        ],
                      ));
  }
}
