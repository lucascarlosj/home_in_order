import 'package:micro_dependencies/micro_dependencies.dart';

class Injector extends InheritedWidget {
  // Mapa para armazenar as instâncias dos serviços injetados.
  final Map<Type, dynamic> _services = {};

  static Injector? _singleton;

  factory Injector({Key? key, required Widget child}) {
    _singleton ??= Injector._internal(child);
    return _singleton!;
  }

  Injector._internal(Widget child) : super(child: child);

  static Injector get instance => _singleton!;

  // Método para adicionar uma instância de um serviço ao Injector.
  void add<T>(T service) {
    _services[T] = service;
  }

  // Método para obter uma instância de um serviço do Injector.
  T get<T>() {
    return _services[T];
  }

  // Um método estático para obter a instância mais próxima do Injector de um determinado contexto.
  static Injector of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Injector>()!;
  }

  @override
  bool updateShouldNotify(Injector oldWidget) => false;
}