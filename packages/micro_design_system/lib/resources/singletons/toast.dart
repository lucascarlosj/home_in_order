import 'package:micro_core/config/router_register.dart';
import 'package:micro_dependencies/micro_dependencies.dart';

class CustomToast {
  static final CustomToast _instance = CustomToast._internal();

  CustomToast._internal();
  factory CustomToast() {
    return _instance;
  }

  void successToast(String message) {
    ShowMToast toast = ShowMToast(globalKey.currentContext!);
    toast.successToast(
      message: message,
      alignment: Alignment.topCenter,
      duration: 2000,
    );
  }

  void errorToast(String message) {
    ShowMToast toast = ShowMToast(globalKey.currentContext!);
    toast.errorToast(
      message: message,
      alignment: Alignment.topCenter,
      duration: 2000,
    );
  }

  void alertToast(String message) {
    ShowMToast toast = ShowMToast(globalKey.currentContext!);
    toast.successToast(
      message: message,
      alignment: Alignment.topCenter,
      backgroundColor: Colors.orangeAccent,
      duration: 2000,
    );
  }
}
