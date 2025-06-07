import 'package:flutter/widgets.dart';

class LayoutBreakpoints {
  static const double mobileWidth = 500;

  static const double tabletWidth = 800;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < mobileWidth;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < tabletWidth &&
      MediaQuery.of(context).size.width > mobileWidth;
}

extension LayoutBreakpointsExtension on BuildContext {
  bool get isMobile => LayoutBreakpoints.isMobile(this);
  bool get isTablet => LayoutBreakpoints.isTablet(this);
}
