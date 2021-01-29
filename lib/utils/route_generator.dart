import 'package:cat_alogue/screens/cat_detail/cat_detail.dart';
import 'package:cat_alogue/screens/cat_list/cat_list.dart';
import 'package:cat_alogue/screens/debug/sample_animations.dart';
import 'package:cat_alogue/screens/home/home_page.dart';
import 'package:flutter/material.dart';

abstract class Routes {
  static const String base = '/';
  static const String cat_list = '/cats';
  static const String cat_detail = '/cats/detail';
  static const String sample_animations = '/sample_anim';
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case Routes.base:
        return _format(Routes.base, HomePage());
      case Routes.cat_list:
        return _format(Routes.cat_list, CatList());
      case Routes.cat_detail:
        return args is String
            ? _format(Routes.cat_detail, CatDetail())
            : _errorRoute();
      case Routes.sample_animations:
        return _format(Routes.sample_animations, SampleAnimations());
      default:
        // If there is no such named route in the switch statement, e.g. /example
        return _errorRoute();
    }
  }

  static PageRoute _format(String routeName, Object destination) {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) {
        // final session = Provider.of<SessionRepository>(context);
        return destination;
      },
    );
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      settings: RouteSettings(name: '/error'),
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Error'),
          ),
          body: Center(
            child: Text('ERROR'),
          ),
        );
      },
    );
  }
}
