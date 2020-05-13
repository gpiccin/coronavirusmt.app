import 'package:coronavirusmt/core/locator.dart';
import 'package:coronavirusmt/core/models/boletim_lista.dart';
import 'package:coronavirusmt/core/viewmodels/covid/boletins_view_model.dart';
import 'package:coronavirusmt/ui/shared/ui_style.dart';
import 'package:coronavirusmt/ui/shared/ui_typography.dart';
import 'package:coronavirusmt/ui/shared/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pagewise/flutter_pagewise.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
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
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
      child: InkWell(
        onTap: () => this._launchBoletimURL(boletim.link),
        child: Container(
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(UIStyle.padding),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Container(
                      child: Icon(
                        Icons.open_in_new,
                        size: 32,
                        color: UIStyle.iconColor,
                      ),
                      height: 60,
                      width: 60,
                    )),
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '${UIHelper.fomartDateDMY(boletim.data)} - Boletim: ${boletim.referencia}',
                        style: UITypography.title,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                      child: Text(
                        "${boletim.casosTotais} casos confirmados, ${boletim.casosNovos} novos ",
                        style: UITypography.subtitle
                            .merge(TextStyle(color: UIStyle.casosColor)),
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
              return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 375),
                child: SlideAnimation(
                  verticalOffset: 50.0,
                  child: FadeInAnimation(
                    child: _buildRow(boletimLista),
                  ),
                ),
              ); //ConfirmadosPorCidadeTile(covidPorCidade);
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
