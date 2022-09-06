// ignore_for_file: avoid_print

import 'package:onlineshop/models/backend/Sqlite%20Functions/sqlite_funcs.dart';
import 'package:onlineshop/models/backend/classes.dart';
import 'package:sqflite/sqflite.dart';

Future<bool> addMobile(Mobile mobile) async {
  try {
    Database database = await openDB();
    int res = await database.insert('Mobile', mobile.toMap());
    print('res = $res');
    database.close();
    return true;
  } catch (e) {
    print('Error: $e');
    return false;
  }
}

Future<bool> deleteMobile(int productId) async {
  try {
    Database database = await openDB();
    await database.delete(
      'Mobile',
      where: 'productId = ?',
      whereArgs: [productId],
    );
    database.close();
    return true;
  } catch (e) {
    print('Error: $e');
    return false;
  }
}

Future<bool> editMobile(Mobile mobile) async {
  try {
    Database database = await openDB();
    await database.update(
      'Mobile',
      mobile.toMap(),
    );
    database.close();
    return true;
  } catch (e) {
    print('Error: $e');
    return false;
  }
}

Future<List<Map<String, Object?>>> getAllMobiles() async {
  try {
    Database database = await openDB();
    List<Map<String, Object?>> data = await database.query('Mobile');
    database.close();
    return data;
  } catch (e) {
    print('Error: $e');
    return [];
  }
}

Future<List<Map<String, Object?>>> getBrandMobile(String brand) async {
  try {
    Database database = await openDB();
    List<Map<String, Object?>> data = await database.query(
      'Mobile',
      where: '',
    );
    database.close();
    return data;
  } catch (e) {
    print('Error: $e');
    return [];
  }
}
