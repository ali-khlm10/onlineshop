// ignore_for_file: depend_on_referenced_packages
// ignore_for_file: unnecessary_null_comparison
// ignore_for_file: avoid_print

import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

Future<Database> openDB() async {
  var databasesPath = await getDatabasesPath();
  var path = join(databasesPath, 'Database.db');

  try {
    await Directory(databasesPath).create(recursive: true);
  } catch (e) {
    print('Directory Error = $e');
  }

  Database db = await openDatabase(path, version: 1, onCreate: _onCreate);

  return db;
}

_onCreate(Database db, int version) async {
  String adminTable = """ 
    CREATE TABLE IF NOT EXISTS Admin(
    userName TEXT PRIMARY KEY,
    password TEXT)""";

  String cameraCatTable = """ 
    CREATE TABLE IF NOT EXISTS CameraCat(
    catId INTEGER PRIMARY KEY,
    catName TEXT)""";  

  String cameraTable = """ 
    CREATE TABLE IF NOT EXISTS Camera(
    name TEXT,
    catId INTEGER,
    productId TEXT PRIMARY KEY,
    PicAddress TEXT,
    kind TEXT,
    dimension TEXT,
    weight TEXT,
    color TEXT,
    battery TEXT,
    axbardariMomtad TEXT,
    storageKind TEXT,
    internalStorage TEXT,
    resolution TEXT,
    picFormat TEXT,
    videoSpeed TEXT,
    explain TEXT,
    price TEXT,
    status TEXT,
    FOREIGN KEY(catId) REFERENCES CameraCat(catId))""";

  String mobileCatTable = """ 
    CREATE TABLE IF NOT EXISTS MobileCat(
    catId INTEGER PRIMARY KEY,
    catName TEXT)""";

  String mobileTable = """ 
    CREATE TABLE IF NOT EXISTS Mobile(
    name TEXT,
    catId INTEGER,
    productId TEXT PRIMARY KEY,
    picAddress TEXT,
    brand TEXT,
    scrrenDimension TEXT,
    weight TEXT,
    color TEXT,
    battery TEXT,
    storageKind TEXT,
    internalStorage TEXT,
    frontCameraResolution TEXT,
    backCameraResolution TEXT,
    picFormat TEXT,
    videoSpeed TEXT,
    explain TEXT,
    price TEXT,
    status TEXT,
    FOREIGN KEY(catId) REFERENCES MobileCat(catId))""";

  String orderTable = """ 
    CREATE TABLE IF NOT EXISTS Orders(
    orderId TEXT PRIMARY KEY,
    customerId TEXT,
    productId TEXT,
    productName TEXT,
    catName TEXT,
    catId TEXT,
    status TEXT)""";

  String userTable = """ 
    CREATE TABLE IF NOT EXISTS User(
    customerId INTEGER PRIMARY KEY,
    customerName TEXT,
    city TEXT,
    phone TEXT,
    address TEXT,
    mail TEXT)""";

  db.execute(adminTable);
  db.execute(cameraTable);
  db.execute(cameraCatTable);
  db.execute(mobileTable);
  db.execute(mobileCatTable);
  db.execute(orderTable);
  db.execute(userTable);
}
