import 'package:flutter/material.dart';
import 'package:flutter_learn/pagers/learn/base.dart';
import 'package:flutter_learn/pagers/learn/data.dart';

/// author   Mr.Hu(Jc) flutter_learn
/// create   2019-07-15 10:55
/// describe 基础Widget页面
/// update

class BasicsWidgetPager extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new BasicsWidgetState("基础Widget");
  }
}

class BasicsWidgetState extends BasePagerSate<BasicsWidgetPager> {
  BasicsWidgetState(String title) : super(title);

  @override
  List<WidgetData> createList() {
    return [
      new WidgetData(
          name: 'Container',
          url: 'https://api.flutter.dev/flutter/widgets/Container-class.html',
          pager: new BasicsWidgetPager()),
    ];
  }

  @override
  Widget buildItemWidget(
      BuildContext context, List<WidgetData> _list, int index) {
    if (index.isOdd) {
      //是奇数
      return new Divider(
        //返回分割线
        height: 1.0,
      );
    } else {
      index = index ~/ 2;
      return new GestureDetector(
        child: new Container(
          child: new Text(
            _list[index].name,
            style: new TextStyle(
              color: Colors.deepOrange,
            ),
          ),
          alignment: Alignment.centerLeft,
          height: 50.0,
          color: Colors.white,
        ),
        onTap: () {
          Navigator.of(context)
              .push(new MaterialPageRoute(builder: (BuildContext context) {
            return _list[index].pager;
          }));
        },
      );
    }
  }
}
