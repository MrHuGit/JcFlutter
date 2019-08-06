import 'package:flutter/material.dart';

import 'home_drawer.dart';

/// author   Mr.Hu(Jc) flutter_learn
/// create   2019-07-10 11:18
/// describe
/// update

// ignore: must_be_immutable
class HomePager extends StatefulWidget {
  Key key;

  HomePager({this.key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<HomePager> {
  Key key;

  HomeState({this.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: new Container(
          child: AppBar(
            leading: IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {},
            ),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.blue[200],
                  Colors.blue[800],
                ]),
          ),
        ),
        preferredSize: Size(MediaQuery.of(context).size.width, 45),
      ),
      body: Text("首页"),
    );
  }
}
