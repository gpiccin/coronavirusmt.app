import 'package:covidmt/core/enum/viewstate.dart';
import 'package:covidmt/core/model/boletim_lista_model.dart';
import 'package:covidmt/core/viewmodels/covid/boletim_lista_view_model.dart';
import 'package:covidmt/pages/base_view.dart';
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

  final _biggerFont = const TextStyle(fontSize: 18.0);

  Widget _buildRow(BoletimLista boletim) {
    return ListTile(
      title: Text(
        "Boletim: ${boletim.referencia}",
        style: _biggerFont,
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
    return BaseView<BoletimListaViewModel>(
      onModelReeady: (model) => model.getBoletins(),
      builder:
          (BuildContext context, BoletimListaViewModel model, Widget child) =>
              Container(
                  child: model.state == ViewState.Busy
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Expanded(
                          child: Container(
                            child: ListView.builder(
                              itemCount: model.boletins.length,
                              padding: const EdgeInsets.all(16.0),
                              itemBuilder: (BuildContext context, int i) {
                                return _buildRow(model.boletins.elementAt(i));
                              },
                            ),
                          ),
                        )),
    );
  }
}
