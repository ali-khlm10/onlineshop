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
    catName TEXT,
    productId INTEGER PRIMARY KEY,
    PicAddress TEXT,
    color TEXT,
    internalStorage TEXT,
    resolution TEXT,
    explain TEXT,
    price TEXT,
    stock INTEGER,
    FOREIGN KEY(catId) REFERENCES CameraCat(catId))""";

  String mobileCatTable = """ 
    CREATE TABLE IF NOT EXISTS MobileCat(
    catId INTEGER PRIMARY KEY,
    catName TEXT)""";

  String mobileTable = """ 
    CREATE TABLE IF NOT EXISTS Mobile(
    name TEXT,
    catId INTEGER,
    catName TEXT,
    productId INTEGER PRIMARY KEY,
    picAddress TEXT,
    weight TEXT,
    color TEXT,
    battery TEXT,
    internalStorage TEXT,
    frontCameraResolution TEXT,
    backCameraResolution TEXT,
    explain TEXT,
    price TEXT,
    stock INTEGER,
    FOREIGN KEY(catId) REFERENCES MobileCat(catId))""";

  String orderTable = """ 
    CREATE TABLE IF NOT EXISTS Orders(
    orderId INTEGER PRIMARY KEY,
    customerId INTEGER,
    productId INTEGER,
    status TEXT,
    FOREIGN KEY(customerId) REFERENCES User(customerId))""";

  String userTable = """ 
    CREATE TABLE IF NOT EXISTS User(
    customerId INTEGER PRIMARY KEY,
    customerName TEXT,
    city TEXT,
    phone TEXT,
    address TEXT,
    mail TEXT)""";

  await db.execute(adminTable);
  await db.execute(cameraTable);
  await db.execute(cameraCatTable);
  await db.execute(mobileTable);
  await db.execute(mobileCatTable);
  await db.execute(orderTable);
  await db.execute(userTable);
}
