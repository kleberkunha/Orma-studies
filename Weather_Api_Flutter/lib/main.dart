import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_api_flutter/views/home.dart';

void main() {

  //Initialize flutter binding
  WidgetsFlutterBinding.ensureInitialized();
  //Chose to be portrait only
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      //remove the debug tag from the top of the application
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}