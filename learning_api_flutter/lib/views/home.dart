
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget{
  const HomeView({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text("API app"),),
      body: const Text("API PAGE"),
    );
  }
}