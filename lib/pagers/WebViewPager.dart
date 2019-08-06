import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

import 'package:flutter/cupertino.dart';
import 'dart:async';

/// author   Mr.Hu(Jc) flutter_learn
/// create   2019/3/5 16:19
/// describe
/// update

// ignore: must_be_immutable
class WebViewPager extends StatefulWidget {
  String _url;
  String _title;

  WebViewPager(this._url, this._title);

  @override
  State<StatefulWidget> createState() =>
      new WebViewPagerState(this._url, this._title);
}

class WebViewPagerState extends State<WebViewPager> {
  WebViewPagerState(this._url, this._title);

  String _url;
  String _title;

//  标记是否正在加载中
  bool _isLoading = true;

  //url监听器
//  StreamSubscription<String> _onUrlChange;
  StreamSubscription<WebViewStateChanged> _onWebViewStateChanged;

  FlutterWebviewPlugin _webViewPlugin = new FlutterWebviewPlugin();

  @override
  void initState() {
    super.initState();
    _onWebViewStateChanged =
        _webViewPlugin.onStateChanged.listen((WebViewStateChanged state) {
      switch (state.type) {
        case WebViewState.shouldStart:
          setState(() {
            _isLoading = true;
          });
          //准备加载
          break;
        case WebViewState.finishLoad:
          setState(() {
            _isLoading = false;
          });
          //加载完成
          break;
        case WebViewState.startLoad:
          //开始加载
          break;
        case WebViewState.abortLoad:
          // TODO: Handle this case.
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> appBarChildren = []
      ..add(new Text(_title))
      ..add(new Container(
        width: 50.0,
      ));
    if (_isLoading) {
      appBarChildren.add(new CupertinoActivityIndicator());
    }

    return new WebviewScaffold(
      url: _url,
      withZoom: true,
      withJavascript: true,
      withLocalUrl: true,
      appBar: new AppBar(
        title: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: appBarChildren,
        ),
      ),
    );
  }

  @override
  void dispose() {
    //回收相关资源
    super.dispose();
//    _onUrlChange.cancel();
    _onWebViewStateChanged.cancel();
    _webViewPlugin.dispose();
  }
}
