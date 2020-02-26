import 'package:flutter/material.dart';
import 'package:ins_like_app/page/feed_list.dart';

class HomeBody extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Flexible(
          child: HomeList()
        )
      ],
    );
  }
}