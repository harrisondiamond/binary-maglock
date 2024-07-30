import 'package:flutter/widgets.dart';

double getSafeWidth(BuildContext context) {
  return MediaQuery.of(context).size.width -
      MediaQuery.of(context).padding.left -
      MediaQuery.of(context).padding.right;
}

double getSafeHeight(BuildContext context) {
  return MediaQuery.of(context).size.height -
      MediaQuery.of(context).padding.top -
      MediaQuery.of(context).padding.bottom;
}
