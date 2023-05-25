import 'dart:html';

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
        // SINGLE CHILD SCROLL VIEW MAKE THE SCREEN ABLE TO SCROLL
        child: SingleChildScrollView(
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
                                  color: Colors.black45),
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
                /*-------------------------------------------------------------------------------------------------------*/
                //CREATING A BUTTON
                /*-------------------------------------------------------------------------------------------------------*/
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(250, 40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          )

                      ),
                      onPressed: () {},
                      child: const Text("BUTTON"),
                    ),
                  ),
                  /*-------------------------------------------------------------------------------------------------------*/
                  //BUTTON WITH ICON
                  /*-------------------------------------------------------------------------------------------------------*/
                  Padding(
                    padding: const EdgeInsets.only(left: 1, right: 20),
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(1, 40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          )
                      ),
                      onPressed: () {},
                      icon: const Icon(Icons.edit),
                      label: const Text(""),
                    ),
                  ),
                ],
              ),
              /*-------------------------------------------------------------------------------------------------------*/
              //CREATING CARD FROM ZERO
              /*-------------------------------------------------------------------------------------------------------*/
              Row(
                children: [
                  Column(
                    children:  const [
                      Padding(
                        padding: EdgeInsets.only(top: 20, left: 70),
                      ),
                      Text("About me",
                        style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: const [
                  Icon(Icons.home),
                  Text("Strasbourg, France"),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: const [
                  Icon(Icons.work),
                  Text("Strasbourg, France"),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: const [
                  Icon(Icons.favorite),
                  Text("Strasbourg, France"),
                ],
              ),
              Row(

                mainAxisSize: MainAxisSize.max,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(top: 40, left: 10),
                  ),
                  Text(
                      "Friends",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,

                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                      children: [carouselCard(), carouselCard()],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [carouselCard(), carouselCard()],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [carouselCard(), carouselCard()],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
                icon: Icon.(Icons.home),

            ),
          ],
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


Card carouselCard(){
  return Card(
      child: Column(
       children: [
         ClipRRect(
           borderRadius: BorderRadius.circular(10), // Image border
           child: SizedBox.fromSize(
             size: const Size.fromRadius(80), // Image radius
             child: Image.asset('images/woman.jpg', fit: BoxFit.cover),
           ),
         ),
         const Text("Maya da Cunha"),
       ],
      ),
  );
}

