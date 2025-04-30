import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class Dbhelper {
  Dbhelper._(); // Private constructor to prevent instantiation

  static final Dbhelper getinstance = Dbhelper._(); // Singleton instance

  Database? mydb; // Database variable

  // Get the database instance
  // This method checks if the database is already opened, and if not, it opens it    
  Future<Database> getdb() async {  
    if (mydb != null) {
      return mydb!;
    } else {
      mydb = await openDb();
      return mydb!;
    }
  }


  // Open the database
  // This method creates the database if it doesn't exist and returns the database instance
  Future<Database> openDb() async {

    Directory appDir =
        await getApplicationDocumentsDirectory(); // Get the application directory

    String dbPath = join(appDir.path, 'mydb.db'); // Create the database path

    return openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) {
        // Create the database table if it doesn't exist
        db.execute(
          "create table note(id integer primary key autoincrement, title text,description text)",
        );
      },
    );
  }

  // ===============================================================================
  // Crud operations

  // 1. Create
  Future<bool> addNote({
    required String mtitle,
    required String mdescription,
  }) async {
    // Check if the database is already opened
    var db = await getdb();

    final result = await db.insert("note", {
      "title": mtitle,
      "description": mdescription,
    });

    return result > 0;
  }

  // 2. Read
  Future<List<Map<String, dynamic>>> getAllNotes() async {
    var db = await getdb();

    List<Map<String, dynamic>> result = await db.query("note");
    return result;
  }

  // 3.Update
  Future<bool> updateNotes({
    required int mid,
    required String mtitle,
    required String mdescription,
  }) async {
    var db = await getdb();

    final result = await db.update("note", {
      "title": mtitle,
      "description": mdescription,
    }, where: "id = $mid");

    return result > 0;
  }

  // 4. Delete
  Future<bool> deleteNote({required int mid}) async {
    var db = await getdb();

    final result = await db.delete("note", where: "id = $mid");

    return result > 0;
  }
}
