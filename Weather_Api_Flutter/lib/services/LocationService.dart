import 'package:flutter/services.dart';
import 'package:location/location.dart';
import 'package:weather_api_flutter/model/GeoPosition.dart';
import 'package:geocoding/geocoding.dart' as geocoding;

class LocationService{
  //Get position
  Future<LocationData?> getPosition() async {
    try{
      Location location = Location();
      return location.getLocation();
    }on PlatformException catch (error){
      print("I will have an error to get the position: \n ${error.message}",);
      return null;
    }
  }
  //Convert position to city
  Future<GeoPosition?> getCity() async {
    final position = await getPosition();
    if (position == null) return null;

    final lat = position.latitude ?? 0.00;
    final lon = position.longitude ?? 0.00;

    List<geocoding.Placemark> placemarks = await geocoding.placemarkFromCoordinates(lat, lon);

    print(placemarks);

    final firstChoice = placemarks.first;
    final GeoPosition geoPosition = GeoPosition(
        city: firstChoice.locality ?? "",
        lat: lat,
        lon: lon
    );
    return geoPosition;
  }

  //Convert city in position
}