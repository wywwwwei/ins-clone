import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>{
  DrawerController _drawerController;

  Widget _buildProfile(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(15.0, 5.0, 5.0, 5.0),
          child: Row(
            children: <Widget>[
              CircleAvatar(
                radius: 50.0,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage('assets/demo/header.png'),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          '0'
                        ),
                        Text(
                          'Posts'
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          '0'
                        ),
                        Text(
                          'Followers'
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          '100'
                        ),
                        Text(
                          'Following'
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Text('Yongwei Wu'),
              ),
              SizedBox(
                height: 8.0,
              ),
              Container(
                height: 30.0,
                child: Text('bio'),
              )
            ],
          ),
        ),
        Center(
          child: Container(
            color: Colors.white,
            height: 35.0,
            width: MediaQuery.of(context).size.width * 0.9,
            child: OutlineButton(
              child: Text('Edit Profile'),
              onPressed: () => print("click"),
              highlightedBorderColor: Colors.grey,
            ),
          ),
        ),
        Divider(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: GestureDetector(
          onTap: () => print("Tap"),
          child: Row(
              children: <Widget>[
                Flexible(
                  child: Text('wywwwwei'),
                ),
                Flexible(
                  child: Icon(Icons.arrow_drop_down),
                ),
              ]
          ),
        ),
        centerTitle: false,
        elevation: 0,
      ),
      drawerEdgeDragWidth: MediaQuery.of(context).size.width * 0.5,
      endDrawer: SizedBox(
        width: MediaQuery.of(context).size.width * 0.7,
        child: Drawer(
          child: ListView(
            children: <Widget>[
              ListTile(
                title: Text('Pearsonal Information'),
                leading: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: Icon(
                    Icons.person_outline,
                    color: Colors.black,
                  ),
                ),
              ),
              ListTile(
                title: Text('Setting'),
                leading: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: Icon(
                    Icons.filter_vintage,
                    color: Colors.black,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: _buildProfile(context),
    );
  }
}