import 'package:flutter/material.dart';

class ImageArguments{
  final String title;
  final String image;

  ImageArguments(this.title,this.image);
}

class ImageDetail extends StatelessWidget{
  static const routeName = '/ImageDetail';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final ImageArguments args = ModalRoute.of(context).settings.arguments;

    return new Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(args.title),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Image(
              image: AssetImage('assets/demo/${args.image}')
            ),
          )
        );
  }
}