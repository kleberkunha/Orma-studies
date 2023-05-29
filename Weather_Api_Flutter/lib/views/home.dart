import 'package:flutter/material.dart';
import 'package:weather_api_flutter/model/GeoPosition.dart';
import 'package:weather_api_flutter/services/ApiService.dart';
import 'package:weather_api_flutter/services/LocationService.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<HomeView> {
  GeoPosition? userPosition;

  @override
  void initState() {
    // TODO: implement initState
    getUserLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(userPosition?.city ?? "My Weather"),),
      body: Center(
        child: Text(
            "My position : \n ${userPosition?.lat}\n${userPosition?.lon}"),
      ),
    );
  }
  //GET USER LOCATION
  getUserLocation() async {
    final loc = await LocationService().getCity();
    if (loc != null) {
      setState(() {
        userPosition = loc;
        ApiService().callApi(userPosition!);
      });
    }
  }
}
