// ignore_for_file: avoid_print

import 'package:onlineshop/models/backend/Sqlite%20Functions/sqlite_funcs.dart';
import 'package:onlineshop/models/backend/classes.dart';
import 'package:sqflite/sqflite.dart';

Future<bool> addCameraCategory(CameraCategory cameraCategory) async {
  try {
    Database database = await openDB();
    int res = await database.insert('CameraCat', cameraCategory.toMap());
    print('res = $res');
    await database.close();
    return true;
  } catch (e) {
    print('Error : $e');
    return false;
  }
}

Future<bool> deleteCameraCategory(int catId) async {
  try {
    Database database = await openDB();
    await database.delete(
      'CameraCat',
      where: 'catId = ?',
      whereArgs: [catId],
    );
    await database.close();
    return true;
  } catch (e) {
    print('Error: $e');
    return false;
  }
}

Future<bool> editCameraCategory(int catId, String newValue) async {
  try {
    Database database = await openDB();
    await database.update(
      'CameraCat',
      {'catName': newValue},
      where: 'catId = ?',
      whereArgs: [catId],
    );
    await database.close();
    return true;
  } catch (e) {
    print('Error: $e');
    return false;
  }
}

Future<List<Map<String, Object?>>> getAllCameraCats() async {
  try {
    Database database = await openDB();
    List<Map<String, Object?>> data = await database.query('CameraCat');
    await database.close();
    return data;
  } catch (e) {
    print('Error: $e');
    return [];
  }
}
