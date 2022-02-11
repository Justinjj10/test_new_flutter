import 'package:flutter/material.dart';
import 'package:flutter_cashrich/screens/Home/home_view.dart';
import 'screens/Splash/splash_view.dart';
import 'package:flutter/cupertino.dart';
import './utils/widgets/page_transition.dart';

enum transitionType { cupertino, material, fade, scale, slideTop, slideBottom }

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case "/":
      return getPageRoute(
        builder: Splash.create(),
        name: routeSettings.name,
        arguments: routeSettings.arguments,
        transition: transitionType.fade,
      );
    case "/home":
      return getPageRoute(
        builder: const HomeView(),
        name: routeSettings.name,
        arguments: routeSettings.arguments,
        transition: transitionType.fade,
      );
   
    default:
      return getPageRoute(
        builder: Scaffold(
          body: Center(
            child: Text("No route defined for ${routeSettings.name}"),
          ),
        ),
      );
  }
}

Route<dynamic> getPageRoute(
    {required Widget builder,
    String? name,
    Object? arguments,
    transitionType? transition = transitionType.cupertino}) {
  switch (transition) {
    case transitionType.cupertino:
      return CupertinoPageRoute(
        builder: (_) => builder,
        settings: RouteSettings(name: name, arguments: arguments),
      );
    case transitionType.material:
      return MaterialPageRoute(
        builder: (_) => builder,
        settings: RouteSettings(name: name, arguments: arguments),
      );
    case transitionType.fade:
      return FadeTransitionPageRoute(
        page: builder,
        settings: RouteSettings(name: name, arguments: arguments),
      );

    case transitionType.scale:
      return ScaleTransitionPageRoute(
        page: builder,
      );
    case transitionType.slideTop:
      return SlideTopPageRoute(
        page: builder,
      );
    case transitionType.slideBottom:
      return SlideBottomPageRoute(
        page: builder,
      );
    default:
      return CupertinoPageRoute(
        builder: (_) => builder,
        settings: RouteSettings(name: name, arguments: arguments),
      );
  }
}
