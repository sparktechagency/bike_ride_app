import 'dart:convert';

import 'package:bike_ride_app/view/models/google_map/autocomplete_prediction.dart';
 // Ensure this import is correct

/// The Autocomplete response contains place predictions and status
class PlaceAutocompleteResponse {
  final String? status;
  final List<AutocompletePrediction>? predictions;

  PlaceAutocompleteResponse({this.status, this.predictions});

  factory PlaceAutocompleteResponse.fromJson(Map<String, dynamic> json) {
    return PlaceAutocompleteResponse(
      status: json['status'] as String?,
      predictions: json['predictions'] != null
          ? (json['predictions'] as List)
          .map<AutocompletePrediction>((jsonItem) => AutocompletePrediction.fromJson(jsonItem))
          .toList()
          : null,
    );
  }

  static PlaceAutocompleteResponse parseAutocompleteResult(String responseBody) {
    final parsed = json.decode(responseBody) as Map<String, dynamic>;
    return PlaceAutocompleteResponse.fromJson(parsed);
  }
}
