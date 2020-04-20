import 'package:covidmt/core/enum/viewstate.dart';
import 'package:covidmt/core/models/boletim_lista.dart';
import 'package:covidmt/core/viewmodels/covid/boletins_view_model.dart';
import 'package:covidmt/ui/shared/base_view.dart';
import 'package:covidmt/ui/shared/ui_typography.dart';
import 'package:covidmt/ui/shared/ui_helpers.dart';
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
        "Boletim: ${boletim.referencia}",
        style: UITypography.title,
      ),
      subtitle: Text(
          "${boletim.data.day}/${boletim.data.month}/${boletim.data.year}"),
      trailing: GestureDetector(
          child: Icon(
            Icons.launch,
            color: Colors.grey,
            size: 24.0,
            semanticLabel: 'Acessar',
          ),
          onTap: () {
            _launchBoletimURL(boletim.link);
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<BoletinsViewModel>(
      onModelReeady: (model) => model.getBoletins(),
      builder: (BuildContext context, BoletinsViewModel model, Widget child) =>
          Container(
              child: model.state == ViewState.Busy
                  ? UIHelper.loading()
                  : Expanded(
                      child: ListView.builder(
                        itemCount: model.boletins.length,
                        padding: const EdgeInsets.all(16.0),
                        itemBuilder: (BuildContext context, int i) {
                          return _buildRow(model.boletins.elementAt(i));
                        },
                      ),
                    )),
    );
  }
}
