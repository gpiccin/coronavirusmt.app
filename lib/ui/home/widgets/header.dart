import 'package:coronavirusmt/core/viewmodels/covid/data_boletim_view_model.dart';
import 'package:coronavirusmt/ui/shared/base_view.dart';
import 'package:coronavirusmt/ui/shared/ui_helpers.dart';
import 'package:coronavirusmt/ui/shared/ui_style.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  Header({this.ultimaAtualizacao, this.referencia, this.boletimUrl});

  final String ultimaAtualizacao;
  final String referencia;
  final String boletimUrl;

  @override
  Widget build(BuildContext context) {
    return BaseView<DataBoletimViewModel>(
        name: "Header",
        builder: (BuildContext context, DataBoletimViewModel model,
                Widget child) =>
            Container(
              height: 60,
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(left: UIStyle.padding),
                      child: Text(
                        "CORONAVÍRUS EM MT",
                        style: TextStyle(
                            color: Color(0xFF353535),
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.1),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: UIStyle.padding),
                    child: Row(
                      children: <Widget>[
                        Text(UIHelper.fomartDateDMY(model.dataDoUltimoBoletim)),
                        SizedBox(
                          width: 4,
                        ),
                        Icon(
                          Icons.calendar_today,
                          size: 16,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ));
  }
}
