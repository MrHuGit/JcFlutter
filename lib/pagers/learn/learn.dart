import 'package:flutter/material.dart';
import 'package:flutter_learn/pagers/learn/base.dart';
import 'package:flutter_learn/pagers/learn/basics/basics.dart';
import 'package:flutter_learn/pagers/learn/data.dart';
import 'package:flutter_learn/pagers/learn/utils.dart';

/// author   Mr.Hu(Jc) flutter_learn
/// create   2019-07-15 10:41
/// describe
/// update

class LearnPager extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new LearnState('Widget学习');
  }
}

class LearnState extends BasePagerSate<LearnPager> {
  LearnState(String title) : super(title);

  @override
  List<WidgetData> createList() {
    return [
      new WidgetData(
          name: '基础 Widgets',
          intro: '在构建您的第一个Flutter应用程序之前，您绝对需要了解这些widget',
          url: 'https://flutterchina.club/widgets/basics/',
          pager: new BasicsWidgetPager()),
      new WidgetData(
        name: 'Material Components',
        intro: '实现了Material Design 指南的视觉、效果、motion-rich的widget',
        url: 'https://flutterchina.club/widgets/material/',
        pager: new BasicsWidgetPager(),
      ),
      new WidgetData(
        name: 'Layout',
        intro: '排列其它widget的columns、rows、grids和其它的layouts',
        url: 'https://flutterchina.club/widgets/layout/',
        pager: new BasicsWidgetPager(),
      ),
      new WidgetData(
        name: 'Text',
        intro: '文本显示和样式',
        url: 'https://flutterchina.club/widgets/text/',
        pager: new BasicsWidgetPager(),
      ),
      new WidgetData(
        name: 'Assets、图片、Icons',
        intro: '管理assets, 显示图片和Icon',
        url: 'https://flutterchina.club/widgets/assets/',
        pager: new BasicsWidgetPager(),
      ),
      new WidgetData(
        name: 'Input',
        intro: 'Material Components 和 Cupertino中获取用户输入的widget',
        url: 'https://flutterchina.club/widgets/input/',
        pager: new BasicsWidgetPager(),
      ),
      new WidgetData(
        name: '动画和Motion',
        intro: '在您的应用中使用动画。查看Flutter中的动画总览',
        url: 'https://flutterchina.club/widgets/animation/',
        pager: new BasicsWidgetPager(),
      ),
      new WidgetData(
        name: '交互模型',
        intro: '响应触摸事件并将用户路由到不同的页面视图（View）',
        url: 'https://flutterchina.club/widgets/interaction/',
        pager: new BasicsWidgetPager(),
      ),
      new WidgetData(
        name: '样式',
        intro: '管理应用的主题，使应用能够响应式的适应屏幕尺寸或添加填充',
        url: 'https://flutterchina.club/widgets/styling/',
        pager: new BasicsWidgetPager(),
      ),
      new WidgetData(
        name: '绘制和效果',
        intro: 'Widget将视觉效果应用到其子组件，而不改变它们的布局、大小和位置',
        url: 'https://flutterchina.club/widgets/painting/',
        pager: new BasicsWidgetPager(),
      ),
      new WidgetData(
        name: 'Async',
        intro: 'Flutter应用的异步模型',
        url: 'https://flutterchina.club/widgets/async/',
        pager: new BasicsWidgetPager(),
      ),
      new WidgetData(
        name: '滚动',
        intro: '滚动一个拥有多个子组件的父组件',
        url: 'https://flutterchina.club/widgets/scrolling/',
        pager: new BasicsWidgetPager(),
      ),
      new WidgetData(
        name: '辅助功能',
        intro: '给你的App添加辅助功能(这是一个正在进行的工作)',
        url: 'https://flutterchina.club/widgets/accessibility/',
        pager: new BasicsWidgetPager(),
      ),
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
      return new Container(
        child: new ListTile(
//          contentPadding: _list[index].intro != null?EdgeInsets.all(10):EdgeInsets.fromLTRB(10,0,0,0),
          title: new Text(
            _list[index].name,
            style: new TextStyle(
              color: Colors.blue[500],
            ),

          ),
          subtitle: _list[index].intro != null
              ? new Text(
                  _list[index].intro,
                  maxLines: 2,
                  style: new TextStyle(
                    fontSize: 11,
                  ),
                )
              : null,
          trailing: new Icon(
            Icons.chevron_right,
            color: Colors.blue[500],
          ),
          onTap: () {
            Navigator.of(context)
                .push(new MaterialPageRoute(builder: (BuildContext context) {
              return _list[index].pager;
            }));
          },
        ),
        color: Colors.white,
//        height: 70,
      );

//      return new GestureDetector(
//        child: new Container(
//          child: new Text(
//            _list[index].name,
//            style: new TextStyle(
//              color: Colors.deepOrange,
//            ),
//          ),
//          alignment: Alignment.centerLeft,
//          height: 50.0,
//          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
//          color: Colors.white,
//        ),
//        onTap: () {
//          Navigator.of(context)
//              .push(new MaterialPageRoute(builder: (BuildContext context) {
//            return _list[index].pager;
//          }));
//        },
//      );
    }
  }
}
