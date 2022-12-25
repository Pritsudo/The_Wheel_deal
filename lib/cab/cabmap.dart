import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';




class CMap extends StatefulWidget {
  @override
  State<CMap> createState() => MapSampleState();
}

class MapSampleState extends State<CMap> {
  final Completer<GoogleMapController> _controller = Completer();
  final TextEditingController _searchController = TextEditingController();
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

static const Marker _kGooglePlexMarker = Marker(
markerId: MarkerId('_kGooglePlexMarker'),
infoWindow: InfoWindow(title: 'Google Plex'),
icon: BitmapDescriptor.defaultMarker,
position:LatLng(37.42796133580664, -122.085749655962),
);

static final Marker _kLakeMarker = Marker(
markerId: const MarkerId('_kLakeMarker'),
infoWindow: const InfoWindow(title: 'Lake'),
icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
position: const LatLng(37.43296265331129, -122.08832357078792),
);


  static const CameraPosition _kLake =  CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);
//static final Polyline _kpolyline = Polyline(
 // polylineId: PolylineId('_kpolyline'),
  //points: [
  //  LatLng(37.42796133580664, -122.085749655962),
  //  LatLng(37.43296265331129, -122.08832357078792),
 // ],
 // width: 5,
 // );

  // static final Polygon _kPolygon = Polygon(
  //   polygonId: PolygonId('_kPolygon'),
  //   points: [
  //   LatLng(37.42796133580664, -122.085749655962),
  //   LatLng(37.43296265331129, -122.08832357078792),
  //   LatLng(37.418, -122.092),
  //   LatLng(37.435, -122.092),
  // ],
  // strokeWidth: 5,
  //   );
  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_new
    return new Scaffold(
     // appBar: AppBar(),
      body:Column( 
      
        children: [
          Row(children:
          [
    
            // Expanded(child:TextFormField(
            //   controller: _searchController,
            //   textCapitalization: TextCapitalization.words,
            //   decoration: InputDecoration(hintText:'search by city' ),
            //   onChanged: (value) {
            //     print(value);
            //   },
            // )),
             
           ],
          ),
        Expanded(
          child:GoogleMap(
        mapType: MapType.normal,
        
        markers: {
          _kGooglePlexMarker,
          
          //_kLakeMarker,
          },
          myLocationButtonEnabled: true,
          myLocationEnabled: true,
          // polylines: {
          // _kpolyline,
          // },
          // polygons: {
          //   _kPolygon,
          // },
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
     // floatingActionButton: FloatingActionButton.extended(
     //   onPressed: _goToTheLake,
     //   label: Text('To the lake!'),
     //   icon: Icon(Icons.directions_boat),
     // ),
    ),], ),);
  }
Future<void> _goToPlace(Map<String,dynamic> place) async{
  final double lat = place['geometry']['location']['lat'];
  final double lng = place['geometry']['location']['lng'];

  final GoogleMapController controller = await _controller.future;
  controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target:LatLng(lat, lng), zoom:12, )));
}
  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}

