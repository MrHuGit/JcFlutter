import 'package:flutter/material.dart';
import 'package:flutter_learn/pagers/test/ScaffoldTest.dart';
import 'package:flutter_learn/pagers/test/SlideBackPager.dart';

class MinePager extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new MineState();
}

class MineState extends State<MinePager> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('MinePager'),
      ),
      body: new ListView(
        padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
        children: <Widget>[
          new ListTile(
            title: const Text('1、111111111'),
            trailing: Icon(Icons.chevron_right),
            onTap: () =>
            {
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (context) => new SlideBackPager()))
            },
          ),
          new ListTile(
            title: const Text('2、2222222222'),
            trailing: Icon(Icons.chevron_right),
            onTap: () => {
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (context) => new ScaffoldTest()))
            },
          ),
        ],
      ),
    );
  }
}
