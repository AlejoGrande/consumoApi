  
import 'package:consumo_api/src/bloc/bloc.dart';
import 'package:flutter/material.dart';


class ClassProvider extends InheritedWidget {
  static ClassProvider _instancia;

  factory ClassProvider({Key key, Widget child}) {
    if (_instancia == null) {
      _instancia = new ClassProvider._internal(key: key, child: child);
    }

    return _instancia;
  }

  ClassProvider._internal({Key key, Widget child}) : super(key: key, child: child);

  final globalBloc = GlobalBloc();

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;

  static GlobalBloc of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ClassProvider>().globalBloc;
  }
}