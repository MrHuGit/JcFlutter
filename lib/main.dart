import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_learn/pagers/IntroducePager.dart';
import 'package:flutter_learn/pagers/MinePager.dart';
import 'package:flutter_learn/pagers/home/home.dart';
import 'package:flutter_learn/pagers/home/home_drawer.dart';
import 'package:flutter_learn/pagers/test/RefreshListPager.dart';

void main() => runApp(JcLearnApp());

class JcLearnApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => JcLearnState();
}

class JcLearnState extends State<JcLearnApp> {
  //statusBar设置为透明，去除半透明遮罩
  final SystemUiOverlayStyle _style =
      SystemUiOverlayStyle(statusBarColor: Colors.transparent);
  final _navigationTitles = ['首页', '介绍', '我的'];
  final _navigationIcons = [Icons.home, Icons.widgets, Icons.person];
  int _currentIndex = 0;
  Widget _bodyIndexedStack;
  Widget _bottomNavigationBar;
  Key _mainScaffoldKey=Key("_mainScaffold");

   _initData() {
    _bodyIndexedStack = new IndexedStack(
      children: <Widget>[HomePager(key:_mainScaffoldKey ,), IntroducePager(), MinePager()],
      index: _currentIndex,
    );
    _bottomNavigationBar = BottomNavigationBar(
      items: List<BottomNavigationBarItem>.generate(_navigationTitles.length,
          (index) {
        return BottomNavigationBarItem(
            icon: Icon(_navigationIcons[index]),
            title: Text(
              _navigationTitles[index],
            ),
            backgroundColor: Colors.red);
      }),
      currentIndex: _currentIndex,
      onTap: (index) => _onNavigationTapClick(index),
    );
  }

  @override
  void initState() {
    print('JcLearnState->initState');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('JcLearnState->build');
    //将style设置到app
    SystemChrome.setSystemUIOverlayStyle(_style);
    _initData();
    return MaterialApp(

      //设备用于为用户识别应用程序的单行描述
      //该标题出现在
      //Android：任务管理器的程序快照之上
      //IOS: 程序切换管理器中
      title: 'JcLearnFlutter',
      //应用程序默认路由的小部件,用来定义当前应用打开的时候，所显示的界面
      home: Scaffold(
        key: _mainScaffoldKey,
        body: _bodyIndexedStack,
        drawer: HomeDrawer(),
        bottomNavigationBar: _bottomNavigationBar,
      ),
      // 在操作系统界面中应用程序使用的主色。
      //该颜色为Android中程序切换中应用图标背景的颜色，当应用图标背景为透明时
      color: Colors.yellow,
      //应用程序小部件使用的颜色。
      //应用程序的主题，各种的定制颜色都可以设置，用于程序主题切换
      theme: ThemeData(

        platform: TargetPlatform.iOS,
        primaryColor:
        ColorTween(begin: Colors.red[100], end: Colors.red[900]).lerp(1),
        accentColor:
        ColorTween(begin: Colors.red[100], end: Colors.red[900]).lerp(1),
      ),
//      //应用程序的顶级路由表{Map<String, WidgetBuilder>}
//      //声明程序中有哪个通过Navigation.of(context).pushNamed跳转的路由
//      //参数以键值对的形式传递
//      //key:路由名字
//      //value:对应的Widget
//      //routes: {
//      //       '/home':(BuildContext context) => HomePage(),
//      //       '/home/one':(BuildContext context) => OnePage(),
//      //       //....
//      //      }
//      routes: ,
//      // 在构建导航器时使用的键。{GlobalKey<NavigatorState>}
//      navigatorKey: ,
//      // 如果构建了导航器，则显示的第一个路由的名称{String}
//      //初始路由，当用户进入程序时，自动打开对应的路由。
//      //(home还是位于一级)
//      //传入的是上面routes的key
//      //跳转的是对应的Widget（如果该Widget有Scaffold.AppBar,并不做任何修改，左上角有返回键）
//      //initialRoute: '/home/one',
//      initialRoute: ,
//      // 应用程序导航到指定路由时使用的路由生成器回调{RouteFactory}
//      //当通过Navigation.of(context).pushNamed跳转路由时，
//      //在routes查找不到时，会调用该方法
//      //onGenerateRoute: (setting){
//      //        //setting.isInitialRoute; bool类型 是否初始路由
//      //        //setting.name; 要跳转的路由名key
//      //        return new PageRouteBuilder(
//      //            pageBuilder: (BuildContext context, _, __) {
//      //        //这里为返回的Widget
//      //              return HomePage();
//      //            },
//      //            opaque: false,
//      //        //跳转动画
//      //            transitionDuration: new Duration(milliseconds: 200),
//      //            transitionsBuilder:
//      //                (___, Animation<double> animation, ____, Widget child) {
//      //              return new FadeTransition(
//      //                opacity: animation,
//      //                child: new ScaleTransition(
//      //                  scale: new Tween<double>(begin: 0.5, end: 1.0)
//      //                      .animate(animation),
//      //                  child: child,
//      //                ),
//      //              );
//      //            });
//      //      }
//      onGenerateRoute: ,
//      // 当 onGenerateRoute 无法生成路由(initialRoute除外)时调用{RouteFactory}
//      //效果跟onGenerateRoute一样
//      //调用顺序为onGenerateRoute ==> onUnknownRoute
//      onUnknownRoute: ,
//      // 为该应用程序创建的导航器的观察者列表{List<NavigatorObserver>}
//      //路由观察器，当调用Navigator的相关方法时，会回调相关的操作
//      //navigatorObservers: [
//      //        MyObserver(),
//      //      ],
//      //    );
//      ////继承NavigatorObserver
//      //class MyObserver extends NavigatorObserver{
//      //  @override
//      //  void didPush(Route route, Route previousRoute) {
//      //    // 当调用Navigator.push时回调
//      //    super.didPush(route, previousRoute);
//      //    //可通过route.settings获取路由相关内容
//      //    //route.currentResult获取返回内容
//      //    //....等等
//      //    print(route.settings.name);
//      //  }
//      navigatorObservers: ,
//      //用于在导航器上面插入小部件，但在由WidgetsApp小部件创建的其他小部件下面插入小部件，或用于完全替换导航器{TransitionBuilder}
//      //当构建一个Widget前调用
//      //一般做字体大小，方向，主题颜色等配置
//      //builder: (BuildContext context, Widget child) {
//      //        return MediaQuery(
//      //          data: MediaQuery.of(context).copyWith(
//      //            //字体大小
//      //                textScaleFactor: 1.4,
//      //              ),
//      //          child: child,
//      //        );
//      //      },
//      builder: ,
//      //如果非空，则调用此回调函数来生成应用程序的标题字符串，否则使用标题。{GenerateAppTitle}
//      //跟上面的title一样，但含有一个context参数
//      //用于做本地化
//      //onGenerateTitle: (context){
//      //        return 'Flutter应用';
//      //      },
//      onGenerateTitle: ,
//      // 此应用程序本地化小部件的初始区域设置基于此值。{Locale}
//      //当前区域，如果为null则使用系统区域
//      //一般用于语言切换
//      //传入两个参数，语言代码，国家代码
//      //Locale('yy','zh')，
//      locale: ,
//      // 这个应用程序本地化小部件的委托。{Iterable<LocalizationsDelegate<dynamic>>}
//      //本地化委托，用于更改Flutter Widget默认的提示语，按钮text等
//      //localizationsDelegates: [
//      //          MyLocalizationsDelegates(),
//      //      ],
//      //class MyLocalizationsDelegates extends LocalizationsDelegate
//      //<MaterialLocalizations>{
//      //  @override
//      //  bool isSupported(Locale locale) {
//      ////是否支持该locale，如果不支持会报异常
//      //    if(locale == const Locale('zh','cn')){
//      //      return true;
//      //    }
//      //    return false;
//      //  }
//      //  @override//是否需要重载
//      //  bool shouldReload(LocalizationsDelegate old)  => false;
//      //
//      //  @override
//      //  Future<MaterialLocalizations> load(Locale locale) {
//      ////加载本地化
//      //    return new SynchronousFuture(new MyLocalizations(locale));
//      //  }
//      //}
//      ////本地化实现，继承DefaultMaterialLocalizations
//      //class MyLocalizations extends DefaultMaterialLocalizations{
//      //  final Locale locale;
//      //  MyLocalizations(this.locale, );
//      //  @override
//      //  String get okButtonLabel {
//      //    if(locale == const Locale('zh','cn')){
//      //      return '好的';
//      //    }else{
//      //      return super.okButtonLabel;
//      //    }
//      //  }
//      //  @override
//      //  String get backButtonTooltip {
//      //    if(locale == const Locale('zh','cn')){
//      //      return '返回';
//      //    }else{
//      //      return super.okButtonLabel;
//      //    }
//      //  }
//      localizationsDelegates: ,
//      // 这个回调负责在应用程序启动时以及用户更改设备的区域设置时选择应用程序的区域设置{LocaleListResolutionCallback}
//      localeListResolutionCallback: ,
//      //{LocaleResolutionCallback}
//      //当传入的是不支持的语种，可以根据这个回调，返回相近,并且支持的语种
//      //localeResolutionCallback: (local,support){
//      //        if(support.contains(support)){
//      //          print('support');
//      //          return local;
//      //        }
//      //        print('no_support');
//      //        return const Locale('us','uk');
//      //      },
//      ////这个代码是随便填的，有可能出错
//      //      locale: Locale('ze','cn'),
//      localeResolutionCallback: ,
//      // 此应用程序已本地化的地区列表{Iterable<Locale>}
//      //传入支持的语种数组
//      // supportedLocales: [
//      //        const Locale('uok'),
//      //        const Locale('meg'),
//      //      ],
//      supportedLocales: ,
//
//
      // 打开绘制基线网格材质应用程序的网格纸覆盖{bool}
      //debug模式下是否显示材质网格，传入bool类型，使用就不写了
      debugShowMaterialGrid:false,
      // 打开性能叠加{bool}
      //当为true时应用程序顶部覆盖一层GPU和UI曲线图，可即时查看当前流畅度情况
      showPerformanceOverlay:false ,
      // 打开栅格缓存图像的棋盘格{bool}
      //当为true时，打开光栅缓存图像的棋盘格
      checkerboardRasterCacheImages: false,
      // 打开渲染到屏幕外位图的图层的棋盘格{bool}
      //当为true时，打开呈现到屏幕位图的层的棋盘格
      checkerboardOffscreenLayers: false,
      // 打开显示框架报告的可访问性信息的覆盖{bool}
      //当为true时，打开Widget边框，类似Android开发者模式中显示布局边界
      showSemanticsDebugger:false ,
      //在选中模式下打开一个小的“DEBUG”横幅，表示应用程序处于选中模式{bool}
      //当为true时，在debug模式下显示右上角的debug字样的横幅，false即为不显示
      debugShowCheckedModeBanner: false,


    );
  }

  void _onNavigationTapClick(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
