import 'package:flutter/material.dart';

/// author   Mr.Hu(Jc) flutter_learn
/// create   2019-07-09 18:22
/// describe
/// update

// ignore: must_be_immutable
class MineAppBar extends StatelessWidget implements PreferredSizeWidget {
  MineAppBar({Key key, List<Color> colors, Widget title}) : super(key: key) {
    child =new  Container(
      child: AppBar(
        title: title == null ? Text("title") : title,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: colors == null
              ? [
                  Colors.red[100],
                  Colors.red,
                ]
              : colors,
        ),
      ),
    );
  }

  Size _preferredSize;
  Widget child;

  @override
  Widget build(BuildContext context) {
    _preferredSize = Size(MediaQuery.of(context).size.width, 45);
    return child;
  }

  @override
  Size get preferredSize => _preferredSize;
}
