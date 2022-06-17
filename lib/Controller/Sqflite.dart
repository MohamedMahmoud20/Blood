// ignore_for_file: non_constant_identifier_names, avoid_print, file_names

import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SQFLITE{

  static Database? db ;

  Future<Database?>  get _db async{
    if(db==null){
      db= await IntialDb();
      return db;
    }
    else {
      return db;
    }
  }


  IntialDb() async{
    String dbpath= await getDatabasesPath();
    String path= join(dbpath , "Todo.db");
    var MyDb= openDatabase(path,onCreate: _OnCreate, version: 1 , onUpgrade: _onUpgrade);
    return MyDb;
  }
  FutureOr<void> _onUpgrade(Database db, int oldVersion, int newVersion) async{
    print("UPGRADE============================");
  }

  Future _OnCreate(Database db, int version) async{
    await db.execute('''
    CREATE TABLE "Todo" (
    "id" INTEGER  NOT NULL PRIMARY KEY  AUTOINCREMENT, 
    "name" TEXT NOT NULL,
    "phone" TEXT,
    "address" TEXT,
    "link" TEXT
    )
    ''');
    print("Created Table =====================================");
    await db.execute('''
    CREATE TABLE "blood" (
    "id" INTEGER  NOT NULL PRIMARY KEY  AUTOINCREMENT,
    "a+" TEXT NOT NULL,
    "b+" TEXT,
    "ab+" TEXT,
    "o+" TEXT,
    "o-" TEXT,
    "ab-" TEXT,
    "a-" TEXT,
    "b-" TEXT
    )
    ''');
    print("Created Table2 =====================================");
    await db.execute('''
    CREATE TABLE "Test" (
    "id" INTEGER  NOT NULL PRIMARY KEY  AUTOINCREMENT,
    "1" TEXT NOT NULL,
    "2" TEXT,
    "3" TEXT,
    "4" TEXT,
    "5" TEXT,
    "6" TEXT,
    "7" TEXT,
    "8" TEXT
    )
    ''');
    print("Created Table3 =====================================");

    await db.execute('''
    CREATE TABLE "User" (
    "id" INTEGER  NOT NULL PRIMARY KEY  AUTOINCREMENT, 
    "D%P" TEXT,
    "age" TEXT,
    "PType" TEXT
    )
    ''');
    print("Created Table4 =====================================");

    await db.execute('''
    CREATE TABLE "UserData" (
    "id" INTEGER  NOT NULL PRIMARY KEY  AUTOINCREMENT, 
   "name" TEXT NOT NULL,
    "phone" TEXT,
    "email" TEXT
    )
    ''');

    await db.execute('''
    CREATE TABLE "Request" (
    "id" INTEGER  NOT NULL PRIMARY KEY  AUTOINCREMENT, 
     "name" TEXT NOT NULL,
    "phone" TEXT,
    "email" TEXT,
    "Hospital" TEXT,
    "age" TEXT,
    "bt" TEXT,
    "d-p" TEXT
    )
    ''');
    print("Created Table6 =====================================");

  }

  Select (String sql) async{
    Database? mydb = await _db;
    var response=await mydb?.rawQuery(sql);
    return response;
  }

  Insert (String sql) async{
    Database? mydb = await _db;
    int? response= await mydb?.rawInsert(sql);
    print("=================Insert Done================");
    return response;
  }

  Delete (String sql) async{
    Database? mydb = await _db;
    int? response= await mydb?.rawDelete(sql);
    print("=================Delete Done================");

    return response;

  }

  Update (String sql) async{
    Database? mydb = await _db;
    int? response= await mydb?.rawUpdate(sql);
    print("=================Update Done================");
    return response;
  }

  deleteAll() async{
    String dbpath= await getDatabasesPath();
    String path= join(dbpath , "Todo.db");
    await deleteDatabase(path);
    print("Delete All Done");
  }
}