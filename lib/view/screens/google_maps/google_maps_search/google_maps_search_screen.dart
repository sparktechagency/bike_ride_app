import 'dart:async';
import 'dart:convert';
import 'package:bike_ride_app/app/utils/app_constant.dart';
import 'package:bike_ride_app/view/models/google_map/autocomplete_prediction.dart';
import 'package:bike_ride_app/view/models/google_map/place_auto_complete_response.dart';
import 'package:bike_ride_app/view/screens/google_maps/network_utils/network_utility.dart';
import 'package:bike_ride_app/view/widgets/custom_container.dart';
import 'package:bike_ride_app/view/widgets/dummy_widget.dart';
import 'package:bike_ride_app/view/widgets/location_list_tile.dart';
import 'package:bike_ride_app/view/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsSearchScreen extends StatefulWidget {
  const GoogleMapsSearchScreen({super.key});

  @override
  State<GoogleMapsSearchScreen> createState() => _GoogleMapsSearchScreenState();
}

class _GoogleMapsSearchScreenState extends State<GoogleMapsSearchScreen> {
  Position? _currentPosition;
  GoogleMapController? _controller;
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  List<AutocompletePrediction> placePrediction = [];
  Timer? _debounce;

  Set<Marker> _currentLocationMarker = {};
  Set<Polyline> _polylines = {};
  final List<LatLng> _polylineCoordinates = [];

  @override
  void initState() {
    super.initState();
    _listenCurrentLocation();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_focusNode);
    });
    _searchController.addListener(() {
      setState(() {});
    });
  }

  Future<void> _getCurrentLocation() async {
    if (await _checkPermissionStatus()) {
      if (await _isGpsServiceEnable()) {
        _currentPosition = await Geolocator.getCurrentPosition(
          locationSettings: const LocationSettings(
            accuracy: LocationAccuracy.best,
          ),
        );
        setState(() {
          _currentLocationMarker = <Marker>{
            Marker(
              markerId: const MarkerId('currentLocation'),
              position: LatLng(
                _currentPosition!.latitude,
                _currentPosition!.longitude,
              ),
              infoWindow: InfoWindow(
                title: 'My location',
                snippet:
                    '${_currentPosition!.latitude}, ${_currentPosition!.longitude}',
              ),
            ),
          };
          _polylineCoordinates.add(
            LatLng(_currentPosition!.latitude, _currentPosition!.longitude),
          );
          _polylines = {
            Polyline(
              polylineId: const PolylineId('myRoutes'),
              points: _polylineCoordinates,
              color: Colors.blue,
              width: 5,
            ),
          };
          _controller?.animateCamera(
            CameraUpdate.newLatLng(
              LatLng(_currentPosition!.latitude, _currentPosition!.longitude),
            ),
          );
        });
        print(
          'LatLong: ${_currentPosition!.latitude}, ${_currentPosition!.longitude}',
        );
      } else {
        _requestGpsService();
      }
    } else {
      _requestPermission();
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
    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      return true;
    }
    return false;
  }

  Future<bool> _requestPermission() async {
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      return true;
    }
    return false;
  }

  Future<bool> _isGpsServiceEnable() async {
    return await Geolocator.isLocationServiceEnabled();
  }

  Future<void> _requestGpsService() async {
    await Geolocator.openLocationSettings();
  }

  void placeAutocomplete(String query) async {
    Uri uri = Uri.parse(
      "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$query&key=${AppConstants.googleApiKey}",
    );
    String? response = await NetworkUtility.fetchUrl(uri);
    if (response != null) {
      PlaceAutocompleteResponse result =
          PlaceAutocompleteResponse.parseAutocompleteResult(response);
      debugPrint("Print: $response");
      if (result.predictions != null) {
        setState(() {
          placePrediction = result.predictions!;
        });
      }
    }
  }

  // Method to update camera position after selecting a prediction
  void _updateCameraPosition(LatLng latLng) {
    _controller?.animateCamera(CameraUpdate.newLatLng(latLng));
  }

  // Method to place marker on tap
  void _addMarker(LatLng latLng) {
    setState(() {
      _currentLocationMarker.add(
        Marker(
          markerId: MarkerId(latLng.toString()),
          position: latLng,
          infoWindow: InfoWindow(title: 'Selected Location'),
        ),
      );
    });
  }

  // Fetch the place details by placeId
  Future<void> _fetchPlaceDetails(String placeId) async {
    Uri uri = Uri.parse(
      "https://maps.googleapis.com/maps/api/place/details/json?placeid=$placeId&key=${AppConstants.googleApiKey}",
    );
    String? response = await NetworkUtility.fetchUrl(uri);
    if (response != null) {
      var result = jsonDecode(response);
      var lat = result['result']['geometry']['location']['lat'];
      var lng = result['result']['geometry']['location']['lng'];
      LatLng placeLatLng = LatLng(lat, lng);
      _updateCameraPosition(placeLatLng); // Move camera to the selected place
      _addMarker(placeLatLng); // Place the marker
      _searchController.text = result['result']['formatted_address'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Maps'),
        actions: [
          CustomButton(
            label: 'Done',
            onPressed: () {
              Get.back();
              // You can handle the "Done" action here
            },
            width: 70.w,
            height: 40.h,
            fontSize: 16.sp,
          ),
          SizedBox(width: 16.w),
        ],
      ),

      body: Stack(
        children: [
          // if (_searchController.text.isEmpty) ...[
          //   GoogleMap(
          //     initialCameraPosition: const CameraPosition(
          //       target: LatLng(23.8041, 90.4152),
          //       zoom: 16,
          //     ),
          //     onMapCreated: (GoogleMapController controller) {
          //       _controller = controller;
          //     },
          //     markers: _currentLocationMarker,
          //     polylines: _polylines,
          //     onTap: _addMarker, // Listen to map tap event and add marker
          //   ),
          // ] else ...[
          //   CustomContainer(
          //     color: Colors.white,
          //     height: double.infinity,
          //     width: double.infinity,
          //   ),
          // ],
          GoogleMap(
            initialCameraPosition: const CameraPosition(
              target: LatLng(23.8041, 90.4152),
              zoom: 16,
            ),
            onMapCreated: (GoogleMapController controller) {
              _controller = controller;
            },
            markers: _currentLocationMarker,
            polylines: _polylines,
            // onTap: _addMarker, // Listen to map tap event and add marker
          ),
          Padding(
            padding: EdgeInsets.all(24.r),
            child: Column(
              children: [
                TextFieldWidget(
                  controller: _searchController,
                  // Remove readOnly: true to allow immediate typing
                  hintText: 'Search Location',
                  maxLine: 1,
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true, // Add this line
                      constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height * 0.9,
                      ),
                      builder: (context) {
                        return Padding(
                          padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom, // Account for keyboard
                          ),
                          child: CustomContainer(
                            color: Colors.white,
                            topLeftRadius: 8.r,
                            topRightRadius: 8.r,
                            child: Padding(
                              padding: EdgeInsets.all(24.r),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextFieldWidget(
                                    controller: _searchController,
                                    hintText: 'Search Location',
                                    maxLine: 1,
                                    autoFocus: true, // Auto-focus when bottom sheet opens
                                    onChange: (value) {
                                      if (_debounce?.isActive ?? false) _debounce!.cancel();
                                      _debounce = Timer(const Duration(milliseconds: 500), () {
                                        placeAutocomplete(value);
                                      });
                                    },
                                  ),
                                  Expanded(
                                    child: ListView.builder(
                                      itemCount: placePrediction.length,
                                      itemBuilder: (context, index) {
                                        return LocationListTile(
                                          location: placePrediction[index].description!,
                                          press: () {
                                            var placeId = placePrediction[index].placeId!;
                                            _fetchPlaceDetails(placeId);
                                            Navigator.pop(context);
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
                // Expanded(
                //   child: ListView.builder(
                //     itemCount: placePrediction.length,
                //     itemBuilder: (context, index) {
                //       return LocationListTile(
                //         location: placePrediction[index].description!,
                //         press: () {
                //           // Fetch the place details by placeId and update the map
                //           var placeId = placePrediction[index].placeId!;
                //           _fetchPlaceDetails(placeId);
                //           // Get.back();
                //         },
                //       );
                //     },
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _getCurrentLocation();
        },
        child: const Icon(Icons.location_on_outlined),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
