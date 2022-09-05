// ignore_for_file: avoid_print

import 'package:onlineshop/models/backend/classes.dart';
import 'package:sqflite/sqflite.dart';

Future<void> addUser(User user, Database database) async {
  try {
    int res = await database.insert('CameraCat', user.toMap());
    print('res = $res');
  } catch (e) {
    print('Error: $e');
  }
}