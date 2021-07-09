import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:transparent_image/transparent_image.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<String> imageList = [
    "https://wallpaperaccess.com/thumb/5003203.jpg",
    "https://wallpaperaccess.com/thumb/20997.jpg",
    "https://wallpaperaccess.com/thumb/756627.jpg",
    "https://wallpaperaccess.com/thumb/5242.jpg",
    "https://wallpaperaccess.com/thumb/810309.jpg",
    "https://wallpaperaccess.com/thumb/167408.jpg",
    "https://wallpaperaccess.com/thumb/389987.jpg",
    "https://wallpaperaccess.com/thumb/24672.jpg",
    "https://wallpaperaccess.com/thumb/128130.jpg",
    "https://wallpaperaccess.com/thumb/323408.jpg",
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(14),
        child: new StaggeredGridView.countBuilder(
          crossAxisCount: 2,
          crossAxisSpacing: 14,
          mainAxisSpacing: 14,
          itemCount: imageList.length,
          itemBuilder: (context,index){
            return Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(12))
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                child: FadeInImage.memoryNetwork(placeholder: kTransparentImage, image: imageList[index],fit: BoxFit.cover,),
              ),
            );
          },staggeredTileBuilder: (index){
            return new StaggeredTile.count(1, index.isEven ? 1.2 : 1.0);
        }),
        ),
      );
  }
}
