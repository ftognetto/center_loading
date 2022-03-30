import 'package:flutter/material.dart';
import 'package:center_loading/src/center_loading.dart';
import 'package:center_loading/src/no_content.dart';

class SearchingWidget extends StatelessWidget {

  /// Creates a searching widget.
  ///
  /// if [loadedAll] is true returns [noResultsWidget] or else [NoContentWidget]
  /// returns [loadinWidget] or [CenterLoading] otherwise

  final bool loadedAll;
  final Widget? noResultsWidget;
  final Widget? loadingWidget;
  final String? platform;

  const SearchingWidget({Key? key, required this.loadedAll, this.noResultsWidget, this.loadingWidget, this.platform}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (loadedAll) 
    ? noResultsWidget ?? const NoContentWidget(text: 'Nessun risultato trovato.')
    : loadingWidget ?? CenterLoading(platform: platform);
  }
}