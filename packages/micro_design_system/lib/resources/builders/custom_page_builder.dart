// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class CustomPageBuilder {
  static _CustomPageBuilderBuilder get instance =>
      _CustomPageBuilderBuilder.instance();
}

class _CustomPageBuilderBuilder {
  PreferredSizeWidget? appbarComponent;
  Widget? floatingActionButtonComponent;
  bool showAppBar = true;
  bool floatingActionButton = false;
  Widget? bodyChild;
  Widget? withOutScaffold;

  _CustomPageBuilderBuilder._();

  static _CustomPageBuilderBuilder instance() {
    return _CustomPageBuilderBuilder._();
  }

  _CustomPageBuilderBuilder withAppBar({required PreferredSizeWidget appbar}) {
    appbarComponent = appbar;
    return this;
  }

  _CustomPageBuilderBuilder withoutAppBar() {
    showAppBar = false;
    return this;
  }

  _CustomPageBuilderBuilder withoutScaffold({required Widget child}) {
    withOutScaffold = child;
    return this;
  }

  _CustomPageBuilderBuilder addBodyChild({required Widget child}) {
    bodyChild = child;
    return this;
  }

  _CustomPageBuilderBuilder withFloating({required Widget child}) {
    floatingActionButtonComponent = child;
    return this;
  }

  Widget build() {
    return withOutScaffold == null
        ? Scaffold(
            appBar: showAppBar ? appbarComponent : null,
            body: bodyChild,
            floatingActionButton: floatingActionButtonComponent ?? Container(),
          )
        : withOutScaffold!;
  }
}
