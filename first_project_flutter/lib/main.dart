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
      //next line remove the sign (DEBUG) from the right top of the screen
      debugShowCheckedModeBanner: false,
      title: 'My first app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BasicsPage(),
    );
  }
}



class BasicsPage extends StatelessWidget{
  const BasicsPage({super.key});

  @override
  Widget build(BuildContext context) {
    //next line get the size of the phone screen
    var size = MediaQuery.of(context).size;
    //var platform = Theme.of(context).platform;
    return Scaffold(
      appBar: AppBar(
        // Next line i added the text home page with a align text
        title: const Align(
          alignment: Alignment(-0.20, 0),
          child: Text("Home page"),
        ),
        // Here i added the Icon from home page and after a action to add the icon to the end of the line
        leading: const Icon(Icons.home),
        actions: const [
          Icon(Icons.handyman),
        ],
        centerTitle: true,
        elevation: 8,
      ),
      body: Container(
        height: size.height,
        width: size.width,
        color : Colors.white,
        //add a padding to all sides
        //padding: const EdgeInsets.only(top: 150),
          child: Center(
            child: Card(
              elevation: 10,
              margin: const EdgeInsets.all(20),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  //next line will set the size of the content on the screen, just need to change min to max or other option
                  mainAxisSize: MainAxisSize.min,
                  //next line does the same as a align-items
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //next line does the same as justify-content
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(10),
                    ),
                    const Text("Test column"),
                    Container(
                      color: Colors.teal,
                      padding: const EdgeInsets.all(5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          // next line is to create a avatar ciscle with image
                          const CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.blue,
                            foregroundImage: AssetImage("images/turtle.jpg"),
                            //same for image link using NetworkImage
                          ),
                          //fromAsset(height: 80, width: 80 ),
                          // the Expanded was used to align the text in the center, very used command
                          Expanded(
                              child: simpleText("Ormaes training"),
                          ),
                        ],
                      ),
                    ),

                    const Padding(
                      padding: EdgeInsets.all(10),
                    ),
                    fromNetwork(),
                    const Padding(
                      padding: EdgeInsets.all(10),
                    ),
                    spanDemo(),
                    const Padding(
                      padding: EdgeInsets.all(10),
                    ),
                  ],
                ),
              ),
/*              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),*/
              ),

            ),
          ),
      );
  }

  Text simpleText(String text){
    return Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 25,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
      ),
      textAlign: TextAlign.center,
    );
  }

  Image fromAsset({required double height, required double width }){
    return Image.asset(
      "images/turtle.jpg",
      fit: BoxFit.cover,
      height: height,
      width: width,
    );
  }

  Image fromNetwork(){
    return Image.network(
      "https://images.pexels.com/photos/2363330/pexels-photo-2363330.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      height: 200,
    );
  }

  Text spanDemo(){
      return const Text.rich(
        TextSpan(
          text: "Testing",
          style: TextStyle(color: Colors.red),
          children: <TextSpan>[
            TextSpan(
                text: "Second Text",
                style: TextStyle(fontWeight: FontWeight.bold )
            ),
            TextSpan(
              text: "First Text",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      );
  }
}
