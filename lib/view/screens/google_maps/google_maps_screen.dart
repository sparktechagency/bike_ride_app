import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';
import 'package:bike_ride_app/app/utils/app_color.dart';
import 'package:bike_ride_app/app/utils/app_constant.dart';
import 'package:bike_ride_app/gen/assets.gen.dart';
import 'package:bike_ride_app/view/screens/google_maps/widget/create_marker_from_icon.dart';
import 'package:bike_ride_app/view/widgets/custom_container.dart';
import 'package:bike_ride_app/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:image/image.dart' as img;
import 'package:location/location.dart';

class GoogleMapsScreen extends StatefulWidget {
  const GoogleMapsScreen({super.key});

  @override
  State<GoogleMapsScreen> createState() => _GoogleMapsScreenState();
}

class _GoogleMapsScreenState extends State<GoogleMapsScreen> {
  GoogleMapController? _controller;
  final Set<Marker> _markers = {};
  Set<Polyline> _polylines = {};
  final PolylinePoints _polylinePoints = PolylinePoints();

  static const LatLng _origin = LatLng(23.775390633135665, 90.38995325184555);
  static const LatLng _destination = LatLng(
    23.760090994557295,
    90.3943580114465,
  );
  static const LatLng _currentLocation = LatLng(
    23.759881920301577,
    90.38941581725936,
  );
  static const LatLng _pitStop = LatLng(23.76333789500554, 90.38913367193292);
  LocationData? currentLocation;
  BitmapDescriptor sourceIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor destinationIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor peopleLocationIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor pitStopIcon = BitmapDescriptor.defaultMarker;

  @override
  void initState() {
    super.initState();
    setCustomMarkerIcon(); // Set custom icons
    _getCurrentLocation();
    _getPolyline();
  }

  // Function to download the image from URL, make it circular, and convert to BitmapDescriptor
  Future<BitmapDescriptor> _getMarkerIcon(String imageUrl) async {
    final response = await http.get(Uri.parse(imageUrl));

    if (response.statusCode == 200) {
      final bytes = response.bodyBytes;
      final image = img.decodeImage(Uint8List.fromList(bytes));

      if (image != null) {
        // Resize and crop the image to make it circular
        final size = 80; // Set the desired size for the marker
        final circle = _createCircularImage(image, size);

        // Convert the circular image back to bytes
        final circularBytes = Uint8List.fromList(img.encodePng(circle));

        return BitmapDescriptor.fromBytes(circularBytes);
      } else {
        throw Exception('Failed to decode image');
      }
    } else {
      throw Exception('Failed to load image');
    }
  }

  img.Image _createCircularImage(img.Image image, int size) {
    // Create a new image with transparency support
    final circle = img.Image(width: size, height: size, numChannels: 4);
    final radius = size / 2;
    final center = radius - 0.5; // Adjust for better centering

    for (int y = 0; y < size; y++) {
      for (int x = 0; x < size; x++) {
        // Calculate distance from the center
        final dx = x - center;
        final dy = y - center;
        final distanceSquared = dx * dx + dy * dy;

        if (distanceSquared <= radius * radius) {
          // Get source pixel coordinates
          final srcX = (x * image.width / size)
              .clamp(0, image.width - 1)
              .toInt();
          final srcY = (y * image.height / size)
              .clamp(0, image.height - 1)
              .toInt();

          // Get the pixel color
          final pixel = image.getPixel(srcX, srcY);
          circle.setPixel(x, y, pixel);
        } else {
          // Set transparent pixel
          circle.setPixel(x, y, img.ColorRgba8(0, 0, 0, 0));
        }
      }
    }
    return circle;
  }

  // Function to load custom marker icons
  void setCustomMarkerIcon() async {
    // Load custom icons asynchronously
    sourceIcon = await createMarkerFromIcon(
      Icon(Icons.flag),
      color: Colors.red,
    );
    // peopleLocationIcon = await createMarkerFromIcon(
    //   Icon(Icons.person, color: Colors.red),
    //   color: AppColors.errorColor,
    //   // fontSize: 40.sp,
    // );
    peopleLocationIcon = await _getMarkerIcon(
      "https://i.pravatar.cc/150?img=30",
    );
    destinationIcon = await createMarkerFromIcon(
      Icon(Icons.flag),
      color: Colors.green,
    );
    pitStopIcon = await BitmapDescriptor.asset(
      ImageConfiguration(size: Size(40.w, 60.h)),
      Assets.images.pitstop.path,
    );

    setState(() {
      _addMarkers();
    });
  }

  void _getCurrentLocation() {
    Location location = Location();
    location.getLocation().then((location) {
      currentLocation = location;
    });
  }

  // Add markers on the map
  void _addMarkers() {
    setState(() {
      _markers.add(
        Marker(
          markerId: const MarkerId("origin"),
          position: _origin,
          infoWindow: const InfoWindow(title: "Start Ride"),
          // icon: sourceIcon,
        ),
      );
      _markers.add(
        Marker(
          markerId: const MarkerId("pitStop"),
          position: _pitStop,
          infoWindow: const InfoWindow(title: "Pit Stop"),
          // icon: BitmapDescriptor.defaultMarkerWithHue(
          //   BitmapDescriptor.hueOrange,
          // ),
          icon: pitStopIcon,
        ),
      );
      _markers.add(
        Marker(
          markerId: const MarkerId("currentLocation"),
          position: _currentLocation,
          infoWindow: const InfoWindow(title: "My Location"),
          icon: peopleLocationIcon,
        ),
      );
      _markers.add(
        Marker(
          markerId: const MarkerId("destination"),
          position: _destination,
          infoWindow: const InfoWindow(title: "Destination"),
          // icon: destinationIcon,
        ),
      );
    });
  }

  // Fetch polyline data for the route
  Future<void> _getPolyline() async {
    debugPrint("🚀 Fetching polyline...");

    final url = Uri.parse(
      'https://maps.googleapis.com/maps/api/directions/json?'
      'origin=${_origin.latitude},${_origin.longitude}&'
      'destination=${_destination.latitude},${_destination.longitude}&'
      'key=${AppConstants.googleApiKey}',
    );

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['routes'].isNotEmpty) {
          final encodedPolyline =
              data['routes'][0]['overview_polyline']['points'];
          final points = _polylinePoints.decodePolyline(encodedPolyline);

          setState(() {
            _polylines = {
              Polyline(
                polylineId: const PolylineId("route"),
                color: Color(0xFF4FAF5A),
                points: points
                    .map((p) => LatLng(p.latitude, p.longitude))
                    .toList(),
                width: 5,
              ),
            };
          });
          debugPrint("✅ Polyline drawn with ${points.length} points");
        } else {
          debugPrint("❌ No routes found in API response");
        }
      } else {
        debugPrint("❌ API Error: ${response.statusCode}");
      }
    } catch (e) {
      debugPrint("🔥 Exception: $e");
    }
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
          target: _currentLocation,
          zoom: 14.5,
        ),
        // mapType: MapType.hybrid,
        myLocationEnabled: true,
        onMapCreated: (controller) => _controller = controller,
        markers: _markers,
        polylines: _polylines,
        // trafficEnabled: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: CustomContainer(
        alignment: Alignment.center,
        height: 75.h,
        width: 75.w,
        shape: BoxShape.circle,
        bordersColor: AppColors.errorColor.withOpacity(.5),
        color: AppColors.errorColor,
        borderWidth: 5.w,
        child: CustomText(
          text: 'SOS',
          fontWeight: FontWeight.bold,
          fontSize: 18.sp,
          color: Colors.white,
        ),
      ),
    );
  }
}
