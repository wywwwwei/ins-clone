import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ins_like_app/utilities/constraints.dart';

class SearchPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage>{
  TextEditingController _textController = TextEditingController();


  //Can't clear textField without canceling focus normally
  _clearText(){
    WidgetsBinding.instance.addPostFrameCallback((_)=>_textController.clear());
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        title: TextField(
          controller: _textController,
          style: TextStyle(
            color: Colors.black,
          ),
          keyboardType: TextInputType.text,
          onSubmitted: (input)=>print(input),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 15.0),
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            suffixIcon: IconButton(
              icon: Icon(
                Icons.close,
                color: Colors.grey,
              ),
              onPressed: _clearText,
            ),
            hintText: 'Search',
            hintStyle:CustomHintStyle,
            filled: true,
            fillColor: Colors.white,
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}