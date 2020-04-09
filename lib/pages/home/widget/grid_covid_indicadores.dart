import 'package:flutter/material.dart';

import 'card_indicador_simples.dart';

class GridCovidIndicadores extends StatelessWidget {
  final double defaultSizeCardSeparation = 8;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: CardIndicadorSimples(
                  "Casos confirmados", "90", "", Colors.blue),
            ),
            SizedBox(
              width: this.defaultSizeCardSeparation,
            ),
            Expanded(
              flex: 1,
              child: CardIndicadorSimples(
                  "Recuperados", "11", "10%", Colors.green),
            )
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: CardIndicadorSimples(
                  "Hospitalizados", "15", "10%", Colors.orange),
            ),
            SizedBox(
              width: this.defaultSizeCardSeparation,
            ),
            Expanded(
              flex: 1,
              child: CardIndicadorSimples(
                  "Isolamento domiciliar", "63", "53%", Colors.orange),
            )
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: CardIndicadorSimples("Óbitos", "1", "1%", Colors.red),
            ),
            SizedBox(
              width: this.defaultSizeCardSeparation,
            ),
            Expanded(
              flex: 1,
              child: Container(),
            )
          ],
        ),
      ],
    );
  }
}
