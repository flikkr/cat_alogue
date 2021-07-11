import 'package:cat_alogue/services/utils/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'screens/home/home_page.dart';
import 'services/data/local_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await LocalDatabase.init();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
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
