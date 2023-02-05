import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;

import 'key_helper.dart';

class DBHelper {
  // DBHelper();
  late Database db;

  DBHelper._();

  static Future<Database> instance() async {
    return await () async {
      final String dbPath = await getDatabasesPath();
      final String path = p.join(dbPath, dbNameKey);

      const String tableCreateCmd = '''
        CREATE TABLE $dbTableNameKey(
            $movieIdKey INTEGER,
            $movieTitleKey TEXT,
            $imgPathKey TEXT,
            $gensKey TEXT,
            $ratingKey REAL,
            $durationKey INTEGER
          )
          ''';

      return await openDatabase(path, version: 1,
          onCreate: (Database db, int version) async {
        // When creating the db, create the table

        await db.execute(tableCreateCmd);

        // await db.execute(
        //     'CREATE TABLE Test (id INTEGER PRIMARY KEY, name TEXT, value INTEGER, num REAL)');
      });
    }();
  }

  // _init() async {
  //   final String dbPath = await getDatabasesPath();
  //   final String path = p.join(dbPath, dbNameKey);

  //   const String tableCreateCmd = '''
  //       CREATE TABLE $dbTableNameKey(
  //           $movieIdKey REAL,
  //           $movieTitleKey TEXT,
  //           $imgPathKey TEXT,
  //           $gensKey TEXT,
  //           $ratingKey REAL,
  //           $durationKey REAL
  //         )
  //         ''';

  //   db = await openDatabase(path, version: 1,
  //       onCreate: (Database db, int version) async {
  //     // When creating the db, create the table

  //     await db.execute(tableCreateCmd);

  //     // await db.execute(
  //     //     'CREATE TABLE Test (id INTEGER PRIMARY KEY, name TEXT, value INTEGER, num REAL)');
  //   });
  // }
}
