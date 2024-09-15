import 'package:flutter/widgets.dart';
import 'package:rum_sdk/rum_sdk.dart';

class RumNavigationObserver extends RouteObserver<PageRoute<dynamic>>{
@override
  void didPop(Route route, Route? previousRoute) {
  super.didPop(route, previousRoute);
  RumFlutter().setViewMeta(name:previousRoute?.settings.name);
  RumFlutter().pushEvent("view_changed",attributes: {
    "route":previousRoute?.settings.name
  });
  }


  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    RumFlutter().setViewMeta(name:route.settings.name);
    RumFlutter().pushEvent("view_changed",attributes: {
      "route":route.settings.name
    });

  }
  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    super.didReplace(newRoute:newRoute, oldRoute:oldRoute);
    RumFlutter().setViewMeta(name: newRoute?.settings.name!);
    RumFlutter().pushEvent("view_changed",attributes: {
      "route":newRoute?.settings.name
    });
  }
}