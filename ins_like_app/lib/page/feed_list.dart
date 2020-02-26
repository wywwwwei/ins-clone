import 'package:flutter/material.dart';
import 'package:ins_like_app/page/feed_image.dart';

class HomeList extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
        itemCount: 6,
        itemBuilder:(BuildContext context,int index){
          print(context);
          print(index);
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: 40.0,
                      width: 40.0,
                      decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: new AssetImage(
                                "assets/demo/dog.jpeg")),
                      ),
                    ),
                  ),
                  Text("Andrew",
                    style: TextStyle(
                        fontWeight: FontWeight.bold
                    ),)
                ],
              ),
              Flexible(
                  child: GestureDetector(
                    child: Image(
                        image: AssetImage("assets/demo/timg.jpeg")
                    ),
                    onTap: (){
                      print("tap");
                      Navigator.pushNamed(context, ImageDetail.routeName,arguments: ImageArguments('Andrew','timg.jpeg'));
                    },
                  )
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  IconButton(icon: Icon(Icons.favorite_border), onPressed: null),
                  IconButton(icon: Icon(Icons.crop_3_2), onPressed: null),
                ],
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: 40.0,
                      width: 40.0,
                      decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: new AssetImage(
                                "assets/demo/dog.jpeg")),
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Add a comment...'
                      ),
                    ),
                  )
                ],
              )
            ],
          );
        }
    );
  }
}