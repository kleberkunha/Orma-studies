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

class FirstAppFromZero extends StatelessWidget {
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
        color: Colors.white,
        /*-------------------------------------------------------------------------------------------------------*/
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                backGroundIMG(width: size.width),
                Padding(
                  padding: const EdgeInsets.only(top: 180),
                  child: profilePicture(),
                ),
              ],
            ),
            /*-------------------------------------------------------------------------------------------------------*/
            SizedBox(
              width: size.width,
              child: Column(
                children: [
                  SizedBox(
                    width: size.width,
                    child: const Center(
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Text(
                            "THIS IS THE NAME",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  /*-------------------------------------------------------------------------------------------------------*/
                  SizedBox(
                    width: size.width,
                    child: const Center(
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            "Hello this is the description of the user only for a test...",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.italic,
                              color: Colors.black45
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
                /*-------------------------------------------------------------------------------------------------------*/
              ),
            ),
            Row(
              children: [
                Button(
                    child: Text("Button"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

Image backGroundIMG({required double width}) {
  return Image.asset(
    "images/camp.jpeg",
    fit: BoxFit.contain,
    width: width,
    alignment: Alignment.topCenter,
  );
}

CircleAvatar profilePicture() {
  return CircleAvatar(
    radius: 70,
    backgroundImage: const AssetImage("images/profile.jpg"),
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
