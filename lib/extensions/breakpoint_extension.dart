import 'package:flutter/material.dart';

// Material 3 (Material You) breakpoints:
// xs: < 600
// sm: 600 - 904
// md: 904 - 1240
// lg: 1240 - 1440
// xl: >= 1440

extension BreakpointExtension on BuildContext {
  static const int sm = 600;
  static const int md = 904;
  static const int lg = 1240;
  static const int xl = 1440;

  double get _width => MediaQuery.of(this).size.width;

  bool get isXs => _width < sm;
  bool get isSm => _width >= sm && _width < md;
  bool get isMd => _width >= md && _width < lg;
  bool get isLg => _width >= lg && _width < xl;
  bool get isXl => _width >= xl;

  bool get isGtXs => _width >= sm;
  bool get isGtSm => _width >= md;
  bool get isGtMd => _width >= lg;
  bool get isGtLg => _width >= xl;

  bool get isLtSm => _width < sm;
  bool get isLtMd => _width < md;
  bool get isLtLg => _width < lg;
  bool get isLtXl => _width < xl;
}
