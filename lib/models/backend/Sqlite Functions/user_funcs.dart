// ignore_for_file: avoid_print

import 'package:onlineshop/models/backend/Sqlite%20Functions/sqlite_funcs.dart';
import 'package:onlineshop/models/backend/classes.dart';
import 'package:sqflite/sqflite.dart';

Future<bool> addUser(User user) async {
  try {
    Database database = await openDB();
    int res = await database.insert('User', user.toMap());
    print('res = $res');
    await database.close();
    return true;
  } catch (e) {
    print('Error: $e');
    return false;
  }
}

Future<bool> deleteUser(int customerId) async {
  try {
    Database database = await openDB();
    await database.delete(
      'User',
      where: 'customerId = ?',
      whereArgs: [customerId],
    );
    await database.close();
    return true;
  } catch (e) {
    print('Error: $e');
    return false;
  }
}

Future<bool> editUser(User user) async {
  try {
    Database database = await openDB();
    await database.update(
      'User',
      user.toMap(),
    );
    await database.close();
    return true;
  } catch (e) {
    print('Error: $e');
    return false;
  }
}

Future<List<Map<String, Object?>>> getAllUsers() async {
  try {
    Database database = await openDB();
    List<Map<String, Object?>> data = await database.query('User');
    await database.close();
    return data;
  } catch (e) {
    print('Error: $e');
    return [];
  }
}