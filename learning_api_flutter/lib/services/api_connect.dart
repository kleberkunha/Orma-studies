import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

Future<APIteste> fetchApiteste() async {
  var key = '206a65208c7e3f38e2c21a2f4c87380a';
  var lat = "lat=";
  var lon = "lon=";
  var appid = "appid=";
  var GetLat = "48.561162";
  var GetLon = "7.737225";

  final response = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/forecast?$lat$GetLat&$lon$GetLon$appid$key'));

  if(response.statusCode == 200){
    return APIteste.fromJson(jsonDecode(response.body));
  }else{
    throw Exception('Failed to load album');
  }
}