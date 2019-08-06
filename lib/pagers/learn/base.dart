import 'package:flutter/material.dart';
import 'package:flutter_learn/pagers/learn/utils.dart';

import 'data.dart';

/// author   Mr.Hu(Jc) flutter_learn
/// create   2019-07-15 14:35
/// describe 公用Widget
/// update

abstract class BasePagerSate<T extends StatefulWidget> extends State<T> {
  final String title;
  List<WidgetData> _list;

  BasePagerSate(this.title) {
    _list = createList();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: WidgetUtils.buildAppBar(context, title),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return buildItemWidget(context, _list, index);
        },
        //设置滑动方向 Axis.horizontal 水平  默认 Axis.vertical 垂直
        scrollDirection: Axis.vertical,
        //内间距
        padding: EdgeInsets.all(0.0),
        //是否倒序显示 默认正序 false  倒序true
        reverse: false,
        //false，如果内容不足，则用户无法滚动 而如果[primary]为true，它们总是可以尝试滚动。
        //在构造中默认是false 它的意思就是为主的意思，primary为true时，我们的controller 滑动监听就不能使用了
        primary: true,
        //确定每一个item的高度 会让item加载更加高效
//        itemExtent: 50.0,
        //内容适配
        //child 高度会适配 item填充的内容的高度,我们非常的不希望child的高度固定，因为这样的话，如果里面的内容超出就会造成布局的溢出。
        //shrinkWrap多用于嵌套listView中 内容大小不确定 比如 垂直布局中 先后放入文字 listView
        // （需要Expend包裹否则无法显示无穷大高度 但是需要确定listview高度 shrinkWrap使用内容适配不会有这样的影响）
        shrinkWrap: true,
        //item 数量
        itemCount: _list.length * 2-1,
        //滑动类型设置
        //这个属性几个滑动的选择
        //AlwaysScrollableScrollPhysics() 总是可以滑动
        //NeverScrollableScrollPhysics禁止滚动
        //BouncingScrollPhysics 内容超过一屏 上拉有回弹效果
        //ClampingScrollPhysics 包裹内容 不会有回弹
        physics: new BouncingScrollPhysics(),
        //cacheExtent  设置预加载的区域
//        cacheExtent: 30.0,
        //滑动监听
//        controller ,
      ),
    );
  }

  List<WidgetData> createList();

  Widget buildItemWidget(
      BuildContext context, List<WidgetData> _list, int index);
}
