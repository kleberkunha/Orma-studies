import 'package:flutter/material.dart';
import 'package:weather_api_flutter/model/ApiAnswer.dart';
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
  ApiAnswer? apiAnswer;

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
            "My position : \n ${apiAnswer?.cnt ?? 0}"),
      ),
    );
  }
  //GET USER LOCATION
  getUserLocation() async {
    final loc = await LocationService().getCity();
    if (loc != null) {
      setState(() {
        userPosition = loc;
      });
      apiAnswer = await ApiService().callApi(userPosition!);
      setState(() {

      });
    }
  }
}
