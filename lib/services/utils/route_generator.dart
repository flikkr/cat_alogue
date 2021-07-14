import 'package:cat_alogue/models/cat.dart';
import 'package:cat_alogue/models/util/gallery_options.dart';
import 'package:cat_alogue/screens/add_cat/cat_form_page.dart';
import 'package:cat_alogue/screens/auth/sign_in_screen.dart';
import 'package:cat_alogue/screens/cat_detail/cat_detail.dart';
import 'package:cat_alogue/screens/cat_list/cat_list.dart';
import 'package:cat_alogue/screens/debug/debug_screen.dart';
import 'package:cat_alogue/screens/debug/sample_animations.dart';
import 'package:cat_alogue/screens/view_photo/gallery.dart';
import 'package:flutter/material.dart';

abstract class Routes {
  static const String base = '/';
  static const String cat_list = '/cats';
  static const String add_cat = '/cat';
  static const String cat_detail = '/cats/detail';
  static const String gallery_view = '/gallery_view';
  static const String sample_animations = '/sample_anim';
  static const String debug_screen = '/debug';
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case Routes.base:
        return _format(Routes.base, SignInScreen());
      case Routes.cat_list:
        return _format(Routes.cat_list, CatList());
      case Routes.cat_detail:
        return args is Cat
            ? _format(Routes.cat_detail, CatDetail(args))
            : _errorRoute();
      case Routes.add_cat:
        return _format(Routes.add_cat, CatFormPage(cat: args as Cat?));
      case Routes.sample_animations:
        return _format(Routes.sample_animations, SampleAnimations());
      case Routes.gallery_view:
        return args is GalleryOptions
            ? _format(Routes.cat_detail, Gallery(args))
            : _errorRoute();
      case Routes.debug_screen:
        return _format(Routes.debug_screen, DebugScreen());
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
        return destination as Widget;
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
