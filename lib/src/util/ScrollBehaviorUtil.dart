import 'package:flutter/cupertino.dart';

class AppScrollBehaviour extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    super.buildViewportChrome(context, child, axisDirection);
    return child;
  }
}
