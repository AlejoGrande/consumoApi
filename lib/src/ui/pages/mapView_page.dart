

import 'package:consumo_api/src/bloc/provider.dart';
import 'package:consumo_api/src/model/geo_model.dart';
import 'package:flutter/material.dart';

import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';


class MapView extends StatefulWidget {

  
  @override
  State<StatefulWidget> createState() => new _MapViewState();
}
MapType _defaultMapType = MapType.satellite;
class _MapViewState extends State<MapView> {
  Completer<GoogleMapController> _controller = Completer();



  void initState() {

    super.initState();
   
  }

  @override
  Widget build(BuildContext context) {
    
    

    return Scaffold(
        backgroundColor: Color(0xFFF2F2F2),
        appBar: AppBar(
          title: Text("Map View"),
          backgroundColor: Colors.deepPurple,          
        ),
        body: Column(children: <Widget>[
          _printMap(),        
        ]),
        floatingActionButton: Align(
          child: FloatingActionButton(
            onPressed: () {
              _changeMapType();
            },
            child: Icon(Icons.layers),
            backgroundColor: Color(0xFF002856),
            elevation: 10,
          ),
          alignment: Alignment(1, -0.6),
        ));
  }

  void _changeMapType() {
    setState(() {
      _defaultMapType = _defaultMapType == MapType.satellite
          ? MapType.normal
          : MapType.satellite;
    });
  }

  Widget _printMap() {
   final bloc = ClassProvider.of(context);
    print(bloc.lat+ "   "+bloc.lon);
    final CameraPosition _posicionInicial = CameraPosition(
      target: LatLng(double.parse(bloc.lat), double.parse(bloc.lon)),
      zoom: 14,
      tilt: 30,
    );
    Set<Marker> markers = new Set<Marker>();

    markers.add(new Marker(
        markerId: MarkerId('My Lotation'),
        position: LatLng(double.parse(bloc.lat), double.parse(bloc.lon))
       ));
    return Expanded(
      child: GoogleMap(
        mapType: _defaultMapType,
        initialCameraPosition: _posicionInicial,
        markers: markers,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
          setState(() {});
        },
        zoomControlsEnabled: false,
        myLocationButtonEnabled: false,
      ),
    );
  }

 

  
}