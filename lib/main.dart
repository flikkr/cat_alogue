import 'package:cat_alogue/screens/auth/auth_wrapper.dart';
import 'package:cat_alogue/services/data/local_database.dart';
import 'package:cat_alogue/services/routes/route_generator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stilo/stilo.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    loadStuff(context);

    return MaterialApp(
      title: 'Cat-alogue',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: const RoundedRectangleBorder(
              borderRadius: StiloBorderRadius.allXl3,
            ),
          ),
        ),
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.grey[300],
          isDense: true,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(StiloBorderRadius.xl),
            borderSide: BorderSide.none,
          ),
        ),
        appBarTheme: const AppBarTheme(centerTitle: true),
      ),
      initialRoute: Routes.base,
      onGenerateRoute: RouteGenerator.generateRoute,
      home: AuthWrapper(),
    );
  }

  void loadStuff(BuildContext context) {
    LocalDatabase.loadAvatars(context);
  }
}
