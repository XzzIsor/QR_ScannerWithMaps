import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:qr_scanner/models/scan_model.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Completer<GoogleMapController> _controller = Completer();
  MapType mapType = MapType.normal;

  @override
  Widget build(BuildContext context) {
    final ScanModel scan = ModalRoute.of(context).settings.arguments;
    

    final CameraPosition _initialPosition = CameraPosition(
      target: scan.getLatLng(),
      zoom: 17.0,
      tilt: 50,
    );

    Set<Marker> markers = new Set<Marker>();
    markers.add(Marker(
      markerId: MarkerId('location'),
      position: scan.getLatLng(),
    ));

    return new Scaffold(
      appBar: AppBar(
        title: Text('Mapa'),
        actions: [
          IconButton(
            icon: Icon(Icons.location_on),
            onPressed: () async {
              final GoogleMapController controller = await _controller.future;
              controller.animateCamera(
                  CameraUpdate.newCameraPosition(_initialPosition));
            },
          )
        ],
      ),
      body: GoogleMap(
        markers: markers,
        zoomControlsEnabled: false,
        mapType: mapType,
        initialCameraPosition: _initialPosition,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.layers),
        onPressed: () {
          setState(() {
            if (mapType == MapType.normal) {
              mapType = MapType.satellite;
            }else{
              mapType = MapType.normal;
            }
          });
        },
      ),
    );
  }
}
