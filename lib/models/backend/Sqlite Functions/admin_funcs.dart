// ignore_for_file: avoid_print

import 'package:onlineshop/models/backend/Sqlite%20Functions/sqlite_funcs.dart';
import 'package:onlineshop/models/backend/classes.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

Future<void> addAdmin(String userName, String password) async {
  try {
    Admin admin = Admin(userName: userName, password: password);
    Database database = await openDB();
    int res = await database.insert('Admin', admin.toMap());
    print('res = $res');
    await database.close();
  } catch (e) {
    print('Error : $e');
  }
}

Future<List<Map<String, Object?>>> getAllAdmins() async {
  try {
    Database database = await openDB();
    List<Map<String, Object?>> data = await database.query('Admin');
    await database.close();
    return data;
  } catch (e) {
    print('Error: $e');
    return [];
  }
}

Future<bool> authenticateAdmin(String userName, String password) async {
  bool authentication = false;
  try {
    List<Map<String, Object?>> allAdmins = await getAllAdmins();
    for (var element in allAdmins) {
      if (element['userName'] == userName && element['password'] == password) {
        authentication = true;
      }
    }
    return authentication;
  } catch (e) {
    print('Error: $e');
    return false;
  }
}

Future<bool> updateAdminPassword(
    String userName, String oldPassword, String newPassword) async {
  Database database;
  try {
    database = await openDB();
  } catch (e) {
    print('Error: $e');
    return false;
  }
  try {
    List<Map<String, Object?>> pass = await database.query(
      'Admin',
      where: 'userName = ?',
      whereArgs: [userName],
    );
    if (pass[0]['password'].toString() == oldPassword &&
        pass[0]['userName'].toString() == userName) {
      await database.update('Admin', {'password': newPassword},
          where: 'userName = ? AND password = ?',
          whereArgs: [userName, oldPassword]);
      await database.close();
      return true;
    } else {
      return false;
    }
  } catch (e) {
    print('Error: $e');
    return false;
  }
}
