import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> _images =[
        "woman1.png",
        "man1.png",
        "woman2.png",
        "man2.png",
        "woman3.png",
        "man3.png",
        "woman4.png",
        "man4.png",
        "woman5.png",
        "man5.png",
        "woman6.png",
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeigth = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFFC9A7A7),
      appBar: AppBar(
        backgroundColor: Color(0xFFCE7C7C),
        centerTitle: true,
        title: Text("Flutter Tinder Card"),
      ),
      body: Center(
        child: Container(
          height: screenHeigth-200,
          child: TinderSwapCard(
            allowVerticalMovement: false,
            totalNum: _images.length,
            stackNum: 3,
            maxHeight: screenHeigth*0.7,
            maxWidth: screenWidth*0.9,
            minHeight: screenHeigth*0.65,
            minWidth: screenWidth*0.8,
            cardBuilder: (context, index){
              return Card(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      color: Color(0xff7e7193),
                      child: Image.asset('assets/${_images[index]}'),
                    ),
                    SizedBox(height: 40,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.close,size: 100,color: Colors.red,),
                        Icon(Icons.favorite,size: 100,color: Colors.green,),
                      ],
                    ),
                  ],
                ),
              );
            },
            swipeCompleteCallback: (CardSwipeOrientation orientation, int index){
              if(orientation==CardSwipeOrientation.LEFT){
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.red,
                    content: Text("RED"),
                    duration: Duration(milliseconds: 200),
                  ),
                );
              }
              else if(orientation==CardSwipeOrientation.RIGHT){
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.green,
                    content: Text("KABUL"),
                   duration: Duration(milliseconds: 200),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
