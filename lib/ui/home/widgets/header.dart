import 'package:coronavirusmt/core/constants.dart';
import 'package:coronavirusmt/core/services/boletim_local_service.dart';
import 'package:coronavirusmt/ui/shared/ui_helpers.dart';
import 'package:coronavirusmt/ui/shared/ui_style.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
        future: BoletimLocalService.box(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return Container(
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
                          color: UIStyle.fontColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.1),
                    ),
                  ),
                ),
                (snapshot.hasData)
                    ? Padding(
                        padding: const EdgeInsets.only(right: UIStyle.padding),
                        child: Row(
                          children: <Widget>[
                            ValueListenableBuilder(
                              valueListenable:
                                  Hive.box(Constants.HIVE_BOLETIM_BOX)
                                      .listenable(),
                              builder: (context, box, widget) {
                                return Text(UIHelper.fomartDateDMY(
                                    BoletimLocalService.getData(box)));
                              },
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Icon(
                              Icons.library_books,
                              size: 16,
                              color: UIStyle.iconColor,
                            )
                          ],
                        ),
                      )
                    : Container()
              ],
            ),
          );
        });
  }
}
