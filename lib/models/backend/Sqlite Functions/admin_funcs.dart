// ignore_for_file: avoid_print

import 'package:onlineshop/models/backend/Sqlite%20Functions/sqlite_funcs.dart';
import 'package:onlineshop/models/backend/classes.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

Future<void> addAdmin(Admin admin) async {
  try {
    Database database = await openDB();
    int res = await database.insert('Admin', admin.toMap());
    print('res = $res');
    database.close();
  } catch (e) {
    print('Error : $e');
  }
}

Future<List<Map<String, Object?>>> getAllAdmins() async {
  try {
    Database database = await openDB();
    List<Map<String, Object?>> data = await database.query('Admin');
    database.close();
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

Future<void> updateAdminPassword(String userName, String password) async {
  try {
    Database database = await openDB();
    database.update('Admin', {'password': password},
        where: 'userName = ?', whereArgs: [userName]);
    database.close();
  } catch (e) {
    print('Error: $e');
  }
}
