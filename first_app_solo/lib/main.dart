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
              aboutMe(),
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
              /////////////////////////////////////////////////////////////////
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                      children: [carouselCard(), carouselCard(),  carouselCard()],
                  ),
                ],
              ),
              myPost(),
              myPost(),
              myPost(),
              myPost(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(12),
        height: 50.0,
        color: Colors.grey[200],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const <Widget> [
            Icon(
              Icons.home,
              color: Colors.deepPurple,

            ),
            Icon(
              Icons.search,
              color: Colors.deepPurple,
            ),
            Icon(
              Icons.add_card,
              color: Colors.deepPurple,
            ),
            Icon(
              Icons.home,
              color: Colors.deepPurple,
            ),
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


Card carouselCard(){
  return Card(
      child: Column(
       children: [
         ClipRRect(
           borderRadius: BorderRadius.circular(10), // Image border
           child: SizedBox.fromSize(
             size: const Size.fromRadius(60), // Image radius
             child: Image.asset('images/woman.jpg', fit: BoxFit.cover),
           ),
         ),
         const Text("Maya"),
       ],
      ),
  );
}

Column aboutMe(){
  return Column(
    mainAxisSize: MainAxisSize.max,
    children: [
      Row(
        children: const [
          Icon(Icons.home),
          Text("Strasbourg, France"),
        ],
      ),
      Row(
        children: const [
          Icon(Icons.work),
          Text("Ormaes, France"),
        ],
      ),
      Row(
        children: const [
          Icon(Icons.favorite),
          Text("Game, Music"),
        ],
      ),
    ],
  );
}


Column myPost(){
  return Column(
    children: [
      padding10Top(),
      Container(
        color: Colors.lightBlueAccent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                padding10Top(),
                Row(
                  children: [
                    padding10Left(),
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: profilePicture(),
                    ),
                    padding10Left(),
                    const Text("Name of the mtfker"),
                  ],
                ),
                padding10Bottom(),
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    const Text("5 hours ago"),
                    padding10Right(),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      Column(
        children: [
          SizedBox(
            child: Center(
              child: Image.asset("images/camp.jpeg"),
            ),
          ),
          Container(
            color: Colors.lightBlueAccent,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(10),
            child: Column(
              children: const [
                Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard ...",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          likeComment(),
        ],
      ),
    ],
  );
}

Padding padding10Left(){
  return const Padding(
      padding: EdgeInsets.only(left: 10),
  );
}

Padding padding10Top(){
  return const Padding(
    padding: EdgeInsets.only(top: 10),
  );
}

Padding padding10Bottom(){
  return const Padding(
    padding: EdgeInsets.only(top: 10),
  );
}

Padding padding10Right(){
  return const Padding(
    padding: EdgeInsets.only(right: 10),
  );
}

Padding padding10All(){
  return const Padding(
    padding: EdgeInsets.all(10),
  );
}

Container likeComment(){
  return Container(
    color: Colors.lightBlueAccent,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children:  [
        Row(
          children: const [
            Icon(Icons.favorite),
            Text("36 Likes"),
          ],
        ),
        Row(
          children: const [
            Icon(Icons.comment),
            Text("50 Comments"),
          ],
        ),
      ],
    ),
  );
}