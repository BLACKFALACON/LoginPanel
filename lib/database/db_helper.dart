import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static Database _dbHelper;

Future<Database> get = async {
    if (_dbHelper != null) return _dbHelper;
    _dbHelper = await initDb();
    return _dbHelper;
  }

  initDb() async {
    var dbFolder = await getDatabasesPath();
    String path = join(dbFolder, "Contact.db");
    return await openDatabase(path, onCreate: _onCreate, version: 1);
  }



  FutureOr<void> _onCreate(Database dbHelper, int version) async {
    return await dbHelper.execute("CREATE TABLE Contact(id INTEGER PRIMARY KEY, name TEXT, phone_number TEXT, avatar TEXT)");
  }

  Future<List<Contact>> getContacts() async {
    var dbClient = await dbHelper;
    var result = await dbClient.query("Contact", orderBy: "name");
    return null;//result.map((data) => Contact.fromMap(data)).toList();
  }
/*
  Future<void> removeContact(int id) async{
    var dbClient = await dbHelper;
    return await dbClient.delete("Contact", where: "id=?", whereArgs: [id]);
  }
  */
}