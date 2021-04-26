import 'dart:async';
import 'package:rxdart/rxdart.dart';



class GlobalBloc {
  final _latController = BehaviorSubject<String>();
  final _lonController = BehaviorSubject<String>();

  //Recuperar los datos del Stream


  Stream<String> get latStream => _latController.stream;
  Stream<String> get lonStream => _lonController.stream;


  //insertar valores al Stream
 
  Function(String) get changelat => _latController.sink.add;
  Function(String) get changelong => _lonController.sink.add;


  //Obtener ultimos valores ingresados

  String get lat => _latController.value;
  String get lon => _lonController.value;


  dispose() {

    _latController?.close();
    _lonController?.close();

  }
}