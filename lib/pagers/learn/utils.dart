import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// author   Mr.Hu(Jc) flutter_learn
/// create   2019-07-15 14:56
/// describe
/// update

class WidgetUtils {
  static Widget buildAppBar(BuildContext context, String title) {
    return new PreferredSize(
      child: new Container(
        child: new AppBar(
          title: new Text(title),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: null,
          actions: <Widget>[
            new IconButton(
              onPressed: () async {
//                DialogUtils.showMaterialDialog(context);
                String value = await DialogUtils.showIosDialog(context);
                Fluttertoast.showToast(msg: value);
              },
              icon: new Icon(Icons.menu),
            ),
          ],
        ),
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blue[300],
              Colors.blue[900],
            ],
          ),
        ),
      ),
      preferredSize: Size(MediaQuery.of(context).size.width, 45),
    );
  }
}

class DialogUtils {
  ///
  ///展示Material 控件
  ///
  static void showMaterialDialog(BuildContext context) {
    showDialog(
        context: context,
        //点击内容外部是否关闭对话框
        barrierDismissible: true,
        builder: (BuildContext context) {
          return new SimpleDialog(
            title: new Text('标题'),
            children: <Widget>[
              new SimpleDialogOption(
                child: new Text('选项1'),
                onPressed: () {
                  Navigator.of(context).pop('选择选项1');
                },
              ),
              new SimpleDialogOption(
                child: new Text('选项2'),
                onPressed: () {
                  Navigator.of(context).pop('选择选项2');
                },
              ),
            ],
            shape: new RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.circular(5.0)),
//            elevation: 10.0,
//            contentPadding: EdgeInsets.all(1.0),
            semanticLabel: '1',
//            titlePadding: EdgeInsets.all(5.0),
          );
        });
  }

  ///
  /// ios样式对话框
  ///
  static Future<String> showIosDialog(BuildContext context) {
    return showCupertinoDialog(
        context: context,
        builder: (BuildContext context) {
          return new CupertinoAlertDialog(
            title: new Text('标题'),
            content: new Text('内容'),
            actions: <Widget>[
              new FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop('点击了取消');
                  },
                  child: new Text('取消')),
              new FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop('点击了确定');
                  },
                  child: new Text('确定')),
            ],
          );
        });
  }

  ///
  /// 自定义弹出的窗口，默认状态下弹出的窗口点击空白处不消失
  ///
  static void showCustomDialog(BuildContext context) {
//    showGeneralDialog(context: null);
  }
}

class TypeChooseDialog extends Dialog {
  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: EdgeInsets.all(15),
      child: new Material(
        type: MaterialType.transparency,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            new Text('网页'),
            new Text('图片'),
            new Padding(
              padding: EdgeInsets.only(top: 15, bottom: 8),
              child: FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('确定')),
            ),
          ],
        ),
      ),
    );
  }
}
