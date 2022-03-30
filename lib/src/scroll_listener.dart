import 'package:flutter/material.dart';

class ScrollListener extends StatelessWidget {

  final Widget child; 
  final void Function() onEndReach;
  final double treshold;
  static const duration = Duration(milliseconds: 500);

  static final _Throttler throttling = _Throttler();

  const ScrollListener({ Key? key, required this.child, required this.onEndReach, this.treshold = 200 }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      child: child,
      onNotification: (scrollInfo) {
        if (scrollInfo.metrics.pixels >= scrollInfo.metrics.maxScrollExtent - treshold) { 
          throttling.run(onEndReach);
          //onEndReach();
        }
      } as bool Function(ScrollNotification)?,
    );
  }

}

class _Throttler {

  _Throttler({ this.throttleGapInMillis = 500});

  final int throttleGapInMillis;
  int? lastActionTime;

  void run(VoidCallback action) {
    if (lastActionTime == null) {
      action();
      lastActionTime = DateTime.now().millisecondsSinceEpoch;
    } else {
      if (DateTime.now().millisecondsSinceEpoch - lastActionTime! > (throttleGapInMillis)) {
        action();
        lastActionTime = DateTime.now().millisecondsSinceEpoch;
      }
    }
  }
}