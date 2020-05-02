import 'package:coronavirusmt/core/locator.dart';
import 'package:coronavirusmt/core/models/boletim_lista.dart';
import 'package:coronavirusmt/core/viewmodels/covid/boletins_view_model.dart';
import 'package:coronavirusmt/ui/shared/ui_style.dart';
import 'package:coronavirusmt/ui/shared/ui_typography.dart';
import 'package:coronavirusmt/ui/shared/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pagewise/flutter_pagewise.dart';
import 'package:url_launcher/url_launcher.dart';

class BoletinsView extends StatefulWidget {
  @override
  _BoletinsViewState createState() => _BoletinsViewState();
}

class _BoletinsViewState extends State<BoletinsView> {
  BoletinsViewModel viewModel;

  _BoletinsViewState() {
    this.viewModel = locator<BoletinsViewModel>();
  }

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        UIHelper.headline("Boletins oficiais do governo",
            padding: EdgeInsets.fromLTRB(0, 0, 0, UIStyle.padding)),
        Expanded(
          child: PagewiseListView(
            pageSize: 10,
            itemBuilder: (context, boletimLista, index) {
              return _buildRow(
                  boletimLista); //ConfirmadosPorCidadeTile(covidPorCidade);
            },
            pageFuture: (pageIndex) {
              return this.viewModel.getBoletins(10, pageIndex);
            },
            loadingBuilder: (context) {
              return UIHelper.loading();
            },
          ),
        )
      ],
    );
  }
}
