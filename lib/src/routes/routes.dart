
import 'package:consumo_api/src/ui/pages/home_page.dart';
import 'package:consumo_api/src/ui/pages/mapView_page.dart';
import 'package:flutter/material.dart';

Map<String,WidgetBuilder> getApplicationRoutes(){
  return <String,WidgetBuilder>{
  'home': (BuildContext context)=>HomePage(),
  'map': (BuildContext context)=>MapView(),
  };
}