import 'package:coronavirusmt/ui/home/views/situacao_atual_cidades.dart';
import 'package:coronavirusmt/ui/home/views/situacao_atual_estado.dart';
import 'package:coronavirusmt/ui/shared/ui_style.dart';
import 'package:coronavirusmt/ui/shared/ui_typography.dart';
import 'package:flutter/material.dart';

class SituacaoAtualView extends StatelessWidget {
  Widget _tab(String text) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(UIStyle.padding),
        child: Text(
          text,
          style: UITypography.subtitle,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Column(
          children: <Widget>[
            TabBar(
              labelColor: UIStyle.fontColor,
              tabs: [
                _tab("Estado"),
                _tab("Cidades"),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  SituacaoAtualEstadoView(),
                  SituacaoAtualCidadesView(),
                ],
              ),
            )
          ],
        ));
  }
}
