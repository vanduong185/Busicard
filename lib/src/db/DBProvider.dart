import 'dart:io';
import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import "package:sns_connect/src/db/models/account.dart";
import "package:sns_connect/src/db/models/profile.dart";
import 'package:sns_connect/src/db/models/social_network.dart';

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
    String path = join(documentsDirectory.path, "SNSConnectDB.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (db, version) async {

      // Create Account Table
      String sqlCreateAccountTable = "CREATE TABLE Account ("
          "id INTEGER PRIMARY KEY,"
          "username TEXT,"
          "password TEXT"
          ")";
      await db.execute(sqlCreateAccountTable);

      // Create Profile Table
      String sqlCreateProfileTable = "CREATE TABLE Profile ("
          "id INTEGER PRIMARY KEY,"
          "firstname TEXT,"
          "lastname TEXT,"
          "position TEXT,"
          "email TEXT,"
          "tel TEXT,"
          "company TEXT"
          ")";
      await db.execute(sqlCreateProfileTable);

      // Create table Social Network has foreign key: profileId link to id of Profile table
      String sqlCreateSocialNetworkTable = "CREATE TABLE SocialNetwork ("
          "id INTEGER PRIMARY KEY,"
          "url TEXT,"
          "type TEXT,"
          "profileId INTEGER,"
          "CONSTRAINT fk_profile FOREIGN KEY (profileId) REFERENCES Profile(id)"
          ")";
      await db.execute(sqlCreateSocialNetworkTable);



    });
  }

  newProfile(Profile profile) async {
    final db = await database;

    //get the biggest id in the table
    var table = await db.rawQuery("SELECT MAX(id)+1 as id FROM Profile");
    int id = table.first["id"];

    //insert to the table using the new id
    var result = await db.rawInsert(
        "INSERT Into Profile (id, firstname, lastname, position, email, tel, company)"
        " VALUES (?,?,?,?,?,?,?)",
        [
          id,
          profile.firstname,
          profile.lastname,
          profile.position,
          profile.email,
          profile.tel,
          profile.company
        ]);
    return result;
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

  newSocialNetwork(SocialNetwork socialNetwork, int profileId) async {
    final db = await database;

    //get the biggest id in the table
    var table = await db.rawQuery("SELECT MAX(id)+1 as id FROM SocialNetwork");
    int id = table.first["id"];

    //insert to the table using the new id
    var result = await db.rawInsert(
        "INSERT Into SocialNetwork (id, url, type, profileId)"
            " VALUES (?,?,?,?)",
        [
          id,
          socialNetwork.url,
          socialNetwork.type,
          socialNetwork.profileId
        ]);
    return result;
  }
}
