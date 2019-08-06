import 'package:flutter/material.dart';
import 'package:flutter_learn/pagers/WebViewPager.dart';

class IntroducePager extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new IntroduceState();
}

class IntroduceState extends State<IntroducePager> {
  final widgetLists = [
    {
      'ScaffoldWidget',
      'https://blog.csdn.net/qq_18948359/article/details/82181475'
    }
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> childrenWidgets = [];

    widgetLists.forEach((stringSet) {
      final _title = stringSet.first;
      childrenWidgets.add(new ListTile(
        title: new Text(_title),
        trailing: Icon(Icons.chevron_right),
        onTap: () => {
              Navigator.of(context)
                  .push(new MaterialPageRoute(builder: (context) {
                return new WebViewPager(stringSet.last, _title);
              }))
            },
      ));
    });
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.deepOrange,
      ),
      body: new ListView(
        padding: EdgeInsets.fromLTRB(5.0, 1.0, 5.0, 1.0),
        children: childrenWidgets,
      ),
    );
  }

  @override
  void didUpdateWidget(IntroducePager oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void deactivate() {
    super.deactivate();
  }
}
