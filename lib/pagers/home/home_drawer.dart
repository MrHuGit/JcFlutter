import 'package:flutter/material.dart';
import 'package:flutter_learn/pagers/learn/learn.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// author   Mr.Hu(Jc) flutter_learn
/// create   2019-07-10 11:21
/// describe
/// update

class HomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountEmail: Text('13365755735@163.com'),
            accountName: Text("Mr.Hu"),
            currentAccountPicture: Icon(Icons.view_array),
            otherAccountsPictures: <Widget>[
              Icon(Icons.title),
              Icon(Icons.title),
              Icon(Icons.title),
              Icon(Icons.title),
            ],
            onDetailsPressed: () {
              Fluttertoast.showToast(msg: "onDetailsPressed");
            },
          ),
          new ListTile(
            leading: new Icon(Icons.list),
            title: new Text('Widget学习'),
//            subtitle: new Text('学习'),
            //后置图标
            trailing: new Icon(Icons.chevron_right),
            //是否三行显示
            isThreeLine: false,
            //直观感受是整体大小
            dense: false,
            //内容内边距
            contentPadding: EdgeInsets.all(1),
            enabled: true,
            //点击事件
            onTap: () {
              Navigator.of(context)
                  .push(new MaterialPageRoute(builder: (BuildContext context) {
                return new LearnPager();
              }));
            },
            //长按事件
//            onLongPress:,
            //是否选中状态
            selected: true,
          )
        ],
      ),
    );
  }
}
