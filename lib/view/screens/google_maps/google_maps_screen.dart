import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsScreen extends StatefulWidget {
  const GoogleMapsScreen({super.key});

  @override
  State<GoogleMapsScreen> createState() => _GoogleMapsScreenState();
}

class _GoogleMapsScreenState extends State<GoogleMapsScreen> {
  Position? _currentPosition;
  GoogleMapController? _controller;
  final String mapApiKey = dotenv.env['GOOGLE_MAP_API_KEY'] ?? "";

  Set<Marker> _currentLocationMarker = {};
  Set<Polyline> _polylines = {};
  final List<LatLng> _polylineCoordinates = [];
  static const LatLng sourceLocation = LatLng(
    23.775390633135665,
    90.38995325184555,
  );
  static const LatLng destination = LatLng(
    23.778321365906365,
    90.39758681868639,
  );

  @override
  void initState() {
    super.initState();
    _listenCurrentLocation();
    getPolyPoints();
  }

  Future<void> getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      request: PolylineRequest(
        origin: PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
        destination: PointLatLng(destination.latitude, destination.longitude),
        mode: TravelMode.driving,
      ),
      googleApiKey: mapApiKey,
    );

    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        _polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }
      setState(() {});
    } else {
      print("No polyline points found.");
    }
  }

  Future<void> _listenCurrentLocation() async {
    if (await _checkPermissionStatus()) {
      if (await _isGpsServiceEnable()) {
        Geolocator.getPositionStream(
          locationSettings: const LocationSettings(
            accuracy: LocationAccuracy.best,
            timeLimit: Duration(seconds: 10),
          ),
        ).listen((pos) {
          print(pos);
        });
        setState(() {});
      } else {
        _requestGpsService();
      }
    } else {
      _requestPermission();
    }
  }

  Future<bool> _checkPermissionStatus() async {
    LocationPermission permission = await Geolocator.checkPermission();
    return permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse;
  }

  Future<bool> _requestPermission() async {
    LocationPermission permission = await Geolocator.requestPermission();
    return permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse;
  }

  Future<bool> _isGpsServiceEnable() async {
    return await Geolocator.isLocationServiceEnabled();
  }

  Future<void> _requestGpsService() async {
    await Geolocator.openLocationSettings();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Track',
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
          target: sourceLocation,
          zoom: 14.5,
        ),
        myLocationEnabled: true,
        onMapCreated: (GoogleMapController controller) {
          _controller = controller;
        },
        markers: {
          Marker(markerId: MarkerId("source"), position: sourceLocation),
          Marker(markerId: MarkerId("destination"), position: destination),
        },
        polylines: {
          Polyline(
            polylineId: PolylineId("route"),
            points: _polylineCoordinates,
            color: Colors.blue,
            width: 5,
          ),
        },
      ),
    );
  }
}
