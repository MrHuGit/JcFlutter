import 'package:flutter/material.dart';

class HomePager extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new HomeState();
}

class HomeState extends State<HomePager> {
  var list=[];
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: const Text('HomePager'),
        ),
        body: new RefreshIndicator(
            child: ListView.builder(itemCount: list.length-1,
            itemBuilder:(context,index){

            } ,), onRefresh: null)
//      body: new ListView(
//        padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
//        children: <Widget>[
//          new ListTile(
//            title: const Text('1、111111111'),
//            trailing: Icon(Icons.chevron_right),
//          ),
//          new ListTile(
//            title: const Text('2、2222222222'),
//            trailing: Icon(Icons.chevron_right),
//          ),
//          new ListTile(
//            title: const Text("3、333333"),
//            trailing: Icon(Icons.chevron_right),
//          )
//        ],
//      ),
        );
  }
}
