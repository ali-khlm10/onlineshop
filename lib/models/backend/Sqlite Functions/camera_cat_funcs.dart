// ignore_for_file: avoid_print

import 'package:onlineshop/models/backend/Sqlite%20Functions/sqlite_funcs.dart';
import 'package:onlineshop/models/backend/classes.dart';
import 'package:sqflite/sqflite.dart';

Future<void> addCameraCategory(
    CameraCategory cameraCategory, Database database) async {
  try {
    Database database = await openDB();
    int res = await database.insert('CameraCat', cameraCategory.toMap());
    print('res = $res');
  } catch (e) {
    print('Error : $e');
  }
}

Future<bool> deleteCamera(int catId) async {
  try {
    Database database = await openDB();
    database.delete(
      'cameraCat',
      where: 'catId = ?',
      whereArgs: [catId],
    );
    return true;
  } catch (e) {
    print('Error: $e');
    return false;
  }
}
