import 'package:flutter/material.dart';

class CustomStep extends StatelessWidget {
  final Widget child;
  final bool hasAppBar;
  final Color? appbarTextColor;
  final Color? appbarBackgroundColor;
  const CustomStep({
    super.key,
    required this.child,
    required this.hasAppBar,
    this.appbarTextColor,
    this.appbarBackgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
