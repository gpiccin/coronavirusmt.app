import 'package:coronavirusmt/core/locator.dart';
import 'package:coronavirusmt/core/viewmodels/shared/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseView<T extends BaseViewModel> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget child) builder;
  final Function(T) onModelReady;
  final String name;

  BaseView({
    this.name,
    this.builder,
    this.onModelReady,
  });

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseViewModel> extends State<BaseView<T>> {
  T model = locator<T>();

  @override
  void initState() {
    if (widget.onModelReady != null) {
      widget.onModelReady(model);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (BuildContext context) => model,
      child: Consumer<T>(builder: widget.builder),
    );
  }
}
