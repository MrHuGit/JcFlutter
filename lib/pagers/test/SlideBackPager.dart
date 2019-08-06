import 'package:flutter/material.dart';

/// author   Mr.Hu(Jc) flutter_learn
/// create   2019-07-08 17:21
/// describe  滑动
/// update

class SlideBackPager extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
//      child: new MaterialApp(
//        theme: new ThemeData(
//            platform: TargetPlatform.android, primaryColor: Colors.blue),
//        home: new Center(
          child:new Scaffold(
            appBar: new AppBar(
              title: const Text("滑动退出"),
            ),
            body: new Center(
              child: const Text(("滑动退出内容"),style: const TextStyle(color: Colors.red),),
            ),
          ),
//        ),
//      ),
    );
  }
}
