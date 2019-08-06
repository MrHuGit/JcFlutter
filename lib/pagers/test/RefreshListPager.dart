import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

/// author   Mr.Hu(Jc) flutter_learn
/// create   2019-07-09 09:59
/// describe
/// update

class RefreshListPager extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new RefreshListState();
  }
}

class RefreshListState<T extends RefreshListPager> extends State<T> {
  List<String> list = new List();
  int _currentPager = 1;
  String loadMoreText = "没有更多数据";

  RefreshListState({Key key});

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    ScrollController _controller;
    return new Scaffold(
      appBar: new AppBar(
//        leading: new IconButton(
//            icon: const Icon(Icons.arrow_back),
//            onPressed: () {
//              Navigator.pop(context);
//            }),
        title: const Text("下拉刷新"),
      ),
      body: new RefreshIndicator(
          child: ListView.builder(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            reverse: false,
            cacheExtent: 10,
            itemBuilder: (context, index) {
              return buildItemWidget(context, index);
            },
            itemCount: list == null ? 0 : list.length * 2 + 1,
            controller: _controller = new ScrollController()
              ..addListener(() {
                var maxScroll = _controller.position.maxScrollExtent;
                var pixel = _controller.position.pixels;
                if (maxScroll == pixel) {
                  setState(() {
                    loadMoreText = "正在加载中...";
                  });
                  _loadData();
                } else {
                  setState(() {
                    loadMoreText = "没有更多数据";
                  });
                }
              }),
          ),
          onRefresh: _pullToRefresh),
    );
  }

  ///
  /// 下拉刷新,必须异步async不然会报错
  ///
  Future<void> _pullToRefresh() async {
    _currentPager = 1;
    _loadData();
  }

  @protected
  Widget buildItemWidget(BuildContext context, int index) {
    if (index.isOdd) {
      //是奇数
      return new Divider(
        //返回分割线
        height: 1.0,
      );
    } else {
      index = index ~/ 2;
      return new Container(
        child: new Text(
          index == list.length ? loadMoreText : list[index],
          style: new TextStyle(color: Colors.deepOrange),
        ),
        height: 50,
        alignment: Alignment.centerLeft,
//
      );
    }
  }

  void _loadData() async {
    //当前线程休眠5秒
    await new Future.delayed(const Duration(seconds: 5));
    setState(() {
      list?.clear();
      list?.addAll(List.generate(100, (index) {
        return "index$index";
      }));
    });
//    setState(() {
//      movieList.addAll(response.data["subjects"]);
//      totalSize = response.data["total"];
//    });
  }
}
