import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/pagers/widgets/MineAppBar.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// author   Mr.Hu(Jc) flutter_learn
/// create   2019-07-09 16:03
/// describe
/// update

class ScaffoldTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new ScaffoldTestState();
  }
}

class ScaffoldTestState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
//      appBar: new MineAppBar(),
      appBar: new AppBar(
//        leading: new Icon(Icons.add),
//        automaticallyImplyLeading: false,
        title: const Text("Scaffold->AppBar->title"),
        actions: <Widget>[
          new Center(
            child: const Text("Scaffold->AppBar->actions"),
          )
        ],
        flexibleSpace: const Text("Scaffold->AppBar->flexibleSpace"),
//        bottom: null,
//        elevation: 0,
//        shape: null,
//        backgroundColor: null,
//        brightness: null,
//        iconTheme: null,
//        actionsIconTheme: null,
//        textTheme: null,
//        primary: true,
//        centerTitle: null,
//        titleSpacing: 12,
//        toolbarOpacity: 12,
//        bottomOpacity: 12,
      ),
      body: new Center(
        //
        // this.controller,
        //    this.focusNode,
        //    this.decoration = const InputDecoration(),
        //    TextInputType keyboardType,
        //    this.textInputAction,
        //    this.textCapitalization = TextCapitalization.none,
        //    this.style,
        //    this.strutStyle,
        //    this.textAlign = TextAlign.start,
        //    this.textAlignVertical,
        //    this.textDirection,
        //    this.readOnly = false,
        //    this.showCursor,
        //    this.autofocus = false,
        //    this.obscureText = false,
        //    this.autocorrect = true,
        //    this.maxLines = 1,
        //    this.minLines,
        //    this.expands = false,
        //    this.maxLength,
        //    this.maxLengthEnforced = true,
        //    this.onChanged,
        //    this.onEditingComplete,
        //    this.onSubmitted,
        //    this.inputFormatters,
        //    this.enabled,
        //    this.cursorWidth = 2.0,
        //    this.cursorRadius,
        //    this.cursorColor,
        //    this.keyboardAppearance,
        //    this.scrollPadding = const EdgeInsets.all(20.0),
        //    this.dragStartBehavior = DragStartBehavior.start,
        //    this.enableInteractiveSelection,
        //    this.onTap,
        //    this.buildCounter,
        //    this.scrollController,
        //    this.scrollPhysics,
        child: new TextField(
//focusNode: new FocusNode()..addListener((){}),
          decoration: new InputDecoration(),
          keyboardType: TextInputType.text,
          textCapitalization: TextCapitalization.characters,
          style: const TextStyle(color: Colors.red),
//          strutStyle: ,
//          textAlign: ,
//          textAlignVertical: ,
//          textDirection: ,
//          readOnly: ,
//          showCursor: ,
//          autofocus: ,
//          obscureText: ,
//          autocorrect: ,
//          maxLines: ,
//          minLines: ,
//          expands: ,
//          maxLength: ,
//          maxLengthEnforced: ,
//          onChanged: ,
//          onEditingComplete: ,
//          onSubmitted: ,
//          inputFormatters: ,
//          enabled: ,
//          cursorWidth: ,
//          cursorRadius: ,
//          cursorColor: ,
//          keyboardAppearance: ,
//          scrollPadding: ,
//          dragStartBehavior: ,
//          enableInteractiveSelection: ,
//          onTap: ,
//          buildCounter: ,
//          scrollController: ,
//          scrollPhysics: ,
        ),
//        child: new Container(
//          child: new GestureDetector(
//            child: const Text("Scaffold->body->Center->Text"),
//            onTap: () {
//              Fluttertoast.showToast(
//                  msg: "Scaffold->body->Center->Text",
//                  gravity: ToastGravity.BOTTOM,
//                  textColor: Colors.amber,
//                  toastLength: Toast.LENGTH_SHORT,
//                  backgroundColor: Colors.black12);
//            },
//          ),
//        ),
      ),
      floatingActionButton: new IconButton(
        iconSize: 40,
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        alignment: Alignment.centerLeft,
        icon: new Icon(Icons.ac_unit),
        color: Colors.deepOrange,
        focusColor: Colors.blue,
        hoverColor: Colors.red,
        highlightColor: Colors.black,
        splashColor: Colors.white,
        disabledColor: Colors.amber,
        onPressed: null,
//        focusNode: null,
        tooltip: "",
      ),
//      floatingActionButtonLocation: null,
//      floatingActionButtonAnimator: null,
//      persistentFooterButtons: <Widget>[],
      drawer: new Drawer(
        child:
//          new Scaffold(
//              appBar: new MineAppBar(),
//              body:
            new ListView(
          padding: const EdgeInsets.only(),
          children: <Widget>[
            new UserAccountsDrawerHeader(
//      margin: EdgeInsets.zero,
              accountName: new Text(
                "SuperLuo",
              ),
              accountEmail: new Text(
                "super_luo@163.com",
              ),
              currentAccountPicture: new Icon(
                Icons.access_alarm,
                size: 40,
              ),
              onDetailsPressed: () {},
              otherAccountsPictures: <Widget>[
                new Icon(Icons.call),
              ],
            ),
            new ClipRect(
              child: new ListTile(
                leading: new CircleAvatar(child: new Text("A")),
                title: new Text('Drawer item A'),
                onTap: () => {},
              ),
            ),
            new ListTile(
              leading: new CircleAvatar(child: new Text("B")),
              title: new Text('Drawer item B'),
              subtitle: new Text("Drawer item B subtitle"),
              onTap: () => {},
            ),
            new AboutListTile(
              icon: new CircleAvatar(child: new Text("Ab")),
              child: new Text("About"),
              applicationName: "Test",
              applicationVersion: "1.0",
              applicationIcon: new Image.asset(
                "images/ymj_jiayou.gif",
                width: 64.0,
                height: 64.0,
              ),
              applicationLegalese: "applicationLegalese",
              aboutBoxChildren: <Widget>[
                new Text("BoxChildren"),
                new Text("box child 2")
              ],
            ),
          ],
        ),
//      ),
      ),

      endDrawer: null,
      bottomSheet: null,
//      backgroundColor: Colors.black26,
      resizeToAvoidBottomInset: true,
      resizeToAvoidBottomPadding: true,
      primary: true,
      drawerDragStartBehavior: DragStartBehavior.down,
      extendBody: true,
//      drawerScrimColor: Colors.black12,
    );
  }
}
