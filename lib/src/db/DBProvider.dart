import 'dart:io';
import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import "package:bussiness_card/src/db/models/account.dart";
import "package:bussiness_card/src/db/models/profile.dart";

// DBProvider class uses singleton pattern because we want have only one instance of it
// and provide global point access to it
class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();

  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "BusicardDB.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (db, version) async {
      String sqlCreateAccountTable = "CREATE TABLE Account ("
          "id INTEGER PRIMARY KEY,"
          "username TEXT,"
          "password TEXT"
          ")";
      String sqlCreateProfileTable = "CREATE TABLE Profile ("
          "id INTEGER PRIMARY KEY,"
          "firstname TEXT,"
          "lastname TEXT,"
          "position TEXT,"
          "email TEXT,"
          "tel TEXT,"
          "company TEXT,"
          "facebookUrl TEXT,"
          "linkedlnUrl TEXT,"
          "twitterUrl TEXT,"
          "instagramUrl TEXT"
          ")";
      await db.execute(sqlCreateAccountTable);
      await db.execute(sqlCreateProfileTable);
    });
  }

  newProfile(Profile newProfile) async {
    final db = await database;
    //get the biggest id in the table
    var table = await db.rawQuery("SELECT MAX(id)+1 as id FROM Profile");
    int id = table.first["id"];
    //insert to the table using the new id
    var raw = await db.rawInsert(
        "INSERT Into Profile (id, firstname, lastname, position, email, tel, company, facebookUrl, linkedlnUrl, twitterUrl, instagramUrl)"
        " VALUES (?,?,?,?,?,?,?,?,?,?,?)",
        [
          id,
          newProfile.firstname,
          newProfile.lastname,
          newProfile.position,
          newProfile.email,
          newProfile.email,
          newProfile.tel,
          newProfile.company,
          newProfile.facebookUrl,
          newProfile.linkedlnUrl,
          newProfile.twitterUrl,
          newProfile.instagramUrl
        ]);
    return raw;
  }

  getProfile(int id) async {
    final db = await database;
    var res = await db.query("Profile", where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? Profile.fromMap(res.first) : null;
  }

  updateProfile(Profile newProfile) async {
    final db = await database;
    var res = await db.update("Profile", newProfile.toMap(),
        where: "id = ?", whereArgs: [newProfile.id]);
    return res;
  }

  deleteProfile(int id) async {
    final db = await database;
    return db.delete("Profile", where: "id = ?", whereArgs: [id]);
  }
}
