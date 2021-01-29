import 'package:flutter/material.dart';

import 'screens/home/home_page.dart';
import 'utils/route_generator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      initialRoute: Routes.base,
      onGenerateRoute: RouteGenerator.generateRoute,
      home: HomePage(),
    );
  }
}
