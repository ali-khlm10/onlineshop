// ignore_for_file: avoid_print

import 'package:onlineshop/models/backend/Sqlite%20Functions/sqlite_funcs.dart';
import 'package:onlineshop/models/backend/classes.dart';
import 'package:sqflite/sqflite.dart';

Future<bool> addMobileCategory(MobileCategory mobileCategory) async {
  try {
    Database database = await openDB();
    int res = await database.insert('MobileCat', mobileCategory.toMap());
    print('res = $res');
    database.close();
    return true;
  } catch (e) {
    print('Error : $e');
    return false;
  }
}

Future<bool> deleteMobileCategory(int catId) async {
  try {
    Database database = await openDB();
    database.delete(
      'MobileCat',
      where: 'catId = ?',
      whereArgs: [catId],
    );
    database.close();
    return true;
  } catch (e) {
    print('Error: $e');
    return false;
  }
}

Future<bool> editMobileCategory(int catId, String newValue) async {
  try {
    Database database = await openDB();
    database.update(
      'MobileCat',
      {'catName': newValue},
      where: 'catId = ?',
      whereArgs: [catId],
    );
    database.close();
    return true;
  } catch (e) {
    print('Error: $e');
    return false;
  }
}

Future<List<Map<String, Object?>>> getAllMobileCats() async {
  try {
    Database database = await openDB();
    List<Map<String, Object?>> data = await database.query('MobileCat');
    database.close();
    return data;
  } catch (e) {
    print('Error: $e');
    return [];
  }
}

Future<MobileCategory> getMobileCatRow(int catId) async {
  try {
    Database database = await openDB();
    List<Map<String, Object?>> data = await database
        .query('MobileCat', where: 'catId = ?', whereArgs: [catId]);
    database.close();
    return MobileCategory(
        catId: int.parse(data[0]['catId'].toString()),
        catName: data[0]['catName'].toString());
  } catch (e) {
    print('Error: $e');
    return MobileCategory(catId: 0, catName: 'Error');
  }
}
