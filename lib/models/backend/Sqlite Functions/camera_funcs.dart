// ignore_for_file: avoid_print

import 'package:onlineshop/models/backend/Sqlite%20Functions/sqlite_funcs.dart';
import 'package:onlineshop/models/backend/classes.dart';
import 'package:sqflite/sqflite.dart';

Future<bool> addCamera(Camera camera) async {
  try {
    Database database = await openDB();
    int res = await database.insert('Camera', camera.toMap());
    print('res = $res');
    await database.close();
    return true;
  } catch (e) {
    print('Error : $e');
    return false;
  }
}

Future<bool> deleteCamera(int productId) async {
  try {
    Database database = await openDB();
    await database.delete(
      'Camera',
      where: 'productId = ?',
      whereArgs: [productId],
    );
    await database.close();
    return true;
  } catch (e) {
    print('Error: $e');
    return false;
  }
}

Future<bool> editCamera(Camera camera) async {
  try {
    Database database = await openDB();
    await database.update(
      'Camera',
      camera.toMap(),
    );
    await database.close();
    return true;
  } catch (e) {
    print('Error: $e');
    return false;
  }
}

Future<List<Map<String, Object?>>> getAllCamera() async {
  try {
    Database database = await openDB();
    List<Map<String, Object?>> data = await database.query('Camera');
    await database.close();
    return data;
  } catch (e) {
    print('Error: $e');
    return [];
  }
}
