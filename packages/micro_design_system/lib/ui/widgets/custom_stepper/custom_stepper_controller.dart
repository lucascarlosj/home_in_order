import 'package:flutter/material.dart';

class CustomStepperController {
  final state = ValueNotifier<int>(0);

  int _listLength = 0;

  set listLength(int value) {
    _listLength = value;
  }

  next() => state.value < (_listLength - 1) ? state.value+= 1 : state.value;

  back() => state.value > 0 ? state.value-= 1 : state.value;
}
