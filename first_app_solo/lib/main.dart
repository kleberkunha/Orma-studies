import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Social app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FirstAppFromZero(),
    );
  }
}

class FirstAppFromZero extends StatelessWidget{
  const FirstAppFromZero({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Align(
        alignment: Alignment(-0.20, 0),
        child: Text("My first app"),
        ),
      ),


      body: Container(
        height: size.height,
        width: size.width,
        color : Colors.white,
        child: Column(
          children: [
            backGroundIMG(height: size.height, width: size.width),
            profilePicture(),
          ],
        ),
        /*child: Stack(
              children: <Widget> [
                ClipRect(
                  child: backGroundIMG(height: size.height, width: size.width),
                ),
                 Align(
                  alignment: Alignment.bottomCenter,
                  child: profilePicture(),
                ),

              ],
            ),*/
      ),
    );
  }
}


/*CircleAvatar profilePicture(){
  return const CircleAvatar(
    radius: 40,
    backgroundColor: Colors.blue,
    foregroundImage: AssetImage("images/turtle.jpg"),
    //same for image link using NetworkImage("link here")
  );
}*/


Image backGroundIMG({required double height, required double width}){
  return Image.asset(
    "images/camp.jpeg",
    fit: BoxFit.contain,
    height: height,
    width: width,
    alignment: Alignment.topCenter,
  );
}

CircleAvatar profilePicture(){
  return  CircleAvatar(
    radius: 70,
    backgroundImage: AssetImage("images/profile.jpg"),
    child: Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
            width: 3,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(70)),
        ),
      ),
    ),
    //same for image link using NetworkImage("link here")
  );
}
