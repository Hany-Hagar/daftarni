// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

var linearGradient = const LinearGradient(
  colors: [Color(0xff667eea), Color(0xff764ba2)],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

var redLinearGradient = const LinearGradient(
  colors: [Color(0xfffe6a67), Color(0xffef5c2b)],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

var defaultBoxShadow = [
  BoxShadow(
    color: Colors.black.withOpacity(0.1),
    blurRadius: 5,
    offset: Offset(0, 2),
  ),
];

var defaultAppBarPadding = EdgeInsetsDirectional.only(
  top:
      MediaQueryData.fromView(
        WidgetsBinding.instance.platformDispatcher.views.first,
      ).padding.top +
      8,
  bottom: 10,
  start: 8,
);
