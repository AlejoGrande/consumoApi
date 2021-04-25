import 'package:consumo_api/src/routes/routes.dart';
import 'package:consumo_api/src/ui/pages/home_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Rutas',initialRoute: '/',routes: getApplicationRoutes(),
    onGenerateRoute: (RouteSettings settings){
      return MaterialPageRoute(builder: (BuildContext context)=>HomePage());
    }, );
    
  }

}