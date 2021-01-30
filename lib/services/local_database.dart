import 'package:sqflite/sqflite.dart';

class LocalDatabase {
  static Database db;

  // Init database
  static Future<void> init() async {
    db = await openDatabase(
      'cat-alogue.db',
      version: 1,
      onCreate: (db, version) async {
        await db.transaction((txn) async {
          await db.execute('''
              CREATE TABLE Cat (id INTEGER PRIMARY KEY, name TEXT, description TEXT);
              ''');
        });
      },
    );
  }
}
