import 'package:coronavirusmt/core/locator.dart';
import 'package:coronavirusmt/core/viewmodels/noticias/noticias_view_model.dart';
import 'package:coronavirusmt/ui/noticias/widgets/noticia_card.dart';
import 'package:coronavirusmt/ui/shared/ui_style.dart';
import 'package:coronavirusmt/ui/shared/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pagewise/flutter_pagewise.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class NoticiasView extends StatefulWidget {
  @override
  _NoticiasViewState createState() => _NoticiasViewState();
}

class _NoticiasViewState extends State<NoticiasView> {
  NoticiasViewModel viewModel;

  _NoticiasViewState() {
    this.viewModel = locator<NoticiasViewModel>();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        UIHelper.headline("Notícias",
            padding: EdgeInsets.fromLTRB(0, 0, 0, UIStyle.padding)),
        Expanded(
          child: PagewiseListView(
            pageSize: 10,
            itemBuilder: (context, noticia, index) {
              return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 375),
                child: SlideAnimation(
                  verticalOffset: 50.0,
                  child: FadeInAnimation(
                    child: NoticiaCard(noticia: noticia),
                  ),
                ),
              );
            },
            pageFuture: (pageIndex) {
              return this.viewModel.getNoticias(10, pageIndex);
            },
            loadingBuilder: (context) {
              return UIHelper.loading();
            },
          ),
        ),
      ],
    );
  }
}
