// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';

class Injector extends InheritedWidget {
  final Map<Type, dynamic> _services = {};

  static Injector? _singleton;

  factory Injector({Key? key, required Widget child}) {
    _singleton ??= Injector._internal(child);
    return _singleton!;
  }

  Injector._internal(Widget child) : super(child: child);

  static Injector get instance => _singleton!;

  void add<T>(T service) {
    _services[T] = service;
  }

  T get<T>() {
    return _services[T];
  }

  static Injector of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Injector>()!;
  }

  @override
  bool updateShouldNotify(Injector oldWidget) => false;
}
