import 'package:flutter/material.dart';

class CustomScrollWidget extends MaterialScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context,
      Widget child,
      ScrollableDetails details,
      ) {

    AxisDirection direction = details.direction;
    return GlowingOverscrollIndicator(

      color: const Color(0xff008080),
      axisDirection: direction,
      showLeading: true,
      showTrailing: true,
      child: child,
    );
  }
}
