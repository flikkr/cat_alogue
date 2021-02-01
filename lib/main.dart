import 'package:flutter/material.dart';
import 'package:hooks_riverpod/all.dart';

import 'screens/home/home_page.dart';
import 'services/local_database.dart';
import 'utils/route_generator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalDatabase.init();
  runApp(ProviderScope(child: MyApp()));
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
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.grey[300],
          isDense: true,
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(10.0),
            ),
            borderSide: BorderSide.none,
          ),
        ),
        appBarTheme: AppBarTheme(
          centerTitle: true,
        ),
      ),
      initialRoute: Routes.base,
      onGenerateRoute: RouteGenerator.generateRoute,
      home: HomePage(),
    );
  }
}
