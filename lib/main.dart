import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:gis_apotik/button.dart';
import 'package:gis_apotik/data.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(
    MaterialApp(
      title: '',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Maps(),
    ),
  );
}

class Maps extends StatefulWidget {
  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  LatLng _kotaPalu = LatLng(-0.8976391114515062, 119.87086368997885);
  Completer<GoogleMapController> _mapController = Completer();
  GoogleMapController _mapsController;
  Set<Marker> markers = Set<Marker>();
  Set<Polyline> _polylines = {};
  List<LatLng> polylineCoordinates = [];

  PolylinePoints polylinePoints = PolylinePoints();
  String googleAPIKey = "AIzaSyAaR5oRvshL2t8yQfJ2j0cAEQpSgBjaWhQ";

  CameraPosition _initialLocation = CameraPosition(
    target: LatLng(-0.9075852, 119.8569728),
    zoom: 13.0,
  );

  @override
  void initState() {
    _setMarker();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return Scaffold(
      body: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: _size.height,
          maxWidth: _size.width,
        ),
        child: Stack(
          children: [
            Expanded(
              child: Container(
                width: _size.width,
                height: double.infinity,
                child: GoogleMap(
                  mapType: MapType.normal,
                  initialCameraPosition: _initialLocation,
                  onMapCreated: (GoogleMapController controller) {
                    if (!_mapController.isCompleted) {
                      _mapController.complete(controller);
                    }
                  },
                  markers: markers,
                  polylines: _polylines,
                ),
              ),
            ),
            Positioned(
              right: 20.0,
              bottom: 40.0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomButton(
                    icon: Icons.zoom_in_outlined,
                    onTap: () => _zoomIn(),
                    height: 60,
                    width: 60,
                  ),
                  SizedBox(height: 10.0),
                  CustomButton(
                    height: 60,
                    width: 60,
                    icon: Icons.zoom_out_outlined,
                    onTap: () => _zoomOut(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _setMarker() {
    markers = {};
    markers.add(
      Marker(
        markerId: MarkerId("0"),
        position: _kotaPalu,
        draggable: false,
        zIndex: 2,
        anchor: Offset(0.5, 0.5),
        infoWindow: InfoWindow(
          title: "Lokasi user",
          snippet: "",
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      ),
    );

    for (var apotik in dataApotik) {
      markers.add(
        Marker(
          markerId: MarkerId(apotik.idMarker.toString()),
          position: LatLng(apotik.latitude, apotik.longitude),
          draggable: false,
          zIndex: 2,
          anchor: Offset(0.5, 0.5),
          infoWindow: InfoWindow(
            title: apotik.namaApotik,
            snippet: apotik.alamat + "\n\nKlik untuk melihat rute =>",
            onTap: () {
              _getPolyline(
                  _kotaPalu, LatLng(apotik.latitude, apotik.longitude));
              // setCameraPosition(LatLng(apotik.latitude, apotik.longitude));
            },
          ),
        ),
      );
    }
  }

  Future<void> setCameraPosition(LatLng target) async {
    final GoogleMapController controller = await _mapController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      bearing: 192.8334901395799,
      target: target,
      tilt: 59.440717697143555,
      zoom: 19.151926040649414,
    )));
  }

  Future<void> _zoomIn() async {
    final GoogleMapController controller = await _mapController.future;
    controller.animateCamera(
      CameraUpdate.zoomIn(),
    );
  }

  Future<void> _zoomOut() async {
    final GoogleMapController controller = await _mapController.future;
    controller.animateCamera(
      CameraUpdate.zoomOut(),
    );
  }

  _getPolyline(LatLng source, LatLng destination) async {
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleAPIKey,
      PointLatLng(source.latitude, source.longitude),
      PointLatLng(destination.latitude, destination.longitude),
      travelMode: TravelMode.driving,
    );

    polylineCoordinates.clear();

    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }

    setState(() {
      Polyline polyline = Polyline(
        polylineId: PolylineId("poly"),
        color: Color.fromARGB(255, 40, 122, 198),
        points: polylineCoordinates,
      );

      _polylines.add(polyline);
    });
  }
}
