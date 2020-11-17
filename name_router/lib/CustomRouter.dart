import 'package:flutter/material.dart';
import 'package:name_router/page_route_anim.dart';
import 'pages/test1.dart';
import 'pages/test2.dart';
import 'pages/test3.dart';
import 'model/PageInfo.dart';
import 'pages/MyHomePage.dart';

class RouteName {
  static const String test1 = 'test1';
  static const String test2 = 'test2';
  static const String test3 = 'test3';
  static const String home = '/';
}

class CustomRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.test1:
        return (NoAnimRouteBuilder(new Test1Page()));
      case RouteName.test2:
        var list = settings.arguments as List;
        var username = list[0] as String;
        var password = list[1] as String;
        return (NoAnimRouteBuilder(new Test2Page(username, password)));
      case RouteName.test3:
        var pageInfo = settings.arguments as PageInfo;
        return (NoAnimRouteBuilder(new Test3Page(pageInfo: pageInfo)));
      case RouteName.home:
        return (NoAnimRouteBuilder(new MyHomePage(title: "首页")));
    }
  }
}

/// Pop路由
class PopRoute extends PopupRoute {
  final Duration _duration = Duration(milliseconds: 300);
  Widget child;

  PopRoute({@required this.child});

  @override
  Color get barrierColor => null;

  @override
  bool get barrierDismissible => true;

  @override
  String get barrierLabel => null;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return child;
  }

  @override
  Duration get transitionDuration => _duration;
}
