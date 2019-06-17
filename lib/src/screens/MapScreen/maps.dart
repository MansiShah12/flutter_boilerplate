import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

@immutable
class Maps extends StatefulWidget {
  final bool fromTab;
const Maps( {Key key, this.fromTab}): super(key: key);

  @override
  _MapsState createState() => _MapsState(fromTab);
}

class _MapsState extends State<Maps> {
  bool fromTab;
_MapsState(fromTabView){
  fromTab = fromTabView;
}
  Completer<GoogleMapController> _controller = Completer();

  static const LatLng _center = const LatLng(20.5937, 78.9629);

  final Set<Marker> _markers = {};
  //static Set<Marker> _markers = {};

  LatLng _lastMapPosition = _center;

  MapType _currentMapType = MapType.normal;

  void initState() {
   setState(() {
      _markers.add(Marker(
        markerId: MarkerId('20.5937'),
        position: const LatLng(20.5937, 78.9629),
        infoWindow: InfoWindow(
          title: 'Really cool place',
          snippet: '5 Star Rating',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('23.686644'),
        position: const LatLng(26.9124, 75.7873),
        infoWindow: InfoWindow(
          title: 'Jaipur',
          snippet: 'Pink City',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('24.686644'),
        position: const LatLng(19.0760, 72.8777),
        infoWindow: InfoWindow(
          title: 'Mumbai',
          snippet: 'City of Dreams',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId('28.6139'),
        position: const LatLng(28.6139, 77.2090),
        infoWindow: InfoWindow(
          title: 'New Delhi',
          snippet: 'Capital of India',
        ),
        icon: BitmapDescriptor.defaultMarker,));
      });
    print("_markers_markers_markers:: $_markers");
  }

  void _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }
appBar(fromTab,context){
   if(!fromTab){
   return AppBar(
                title: Text("Map"),
                automaticallyImplyLeading: true,
                leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context, false),
                ));
                }else{
                  return null;
                }
 }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar:appBar(fromTab,context),
        body: Stack(
          children: <Widget>[
            GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: _center,
                  zoom: 4.5,
                ),
                mapType: _currentMapType,
                markers: _markers,
                gestureRecognizers: Set()
                  ..add(Factory<PanGestureRecognizer>(
                      () => PanGestureRecognizer()))),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.topRight,
                child: Column(
                  children: <Widget>[
                    FloatingActionButton(
                      onPressed: _onMapTypeButtonPressed,
                      materialTapTargetSize: MaterialTapTargetSize.padded,
                      backgroundColor: Colors.green,
                      child: const Icon(Icons.map, size: 36.0),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
