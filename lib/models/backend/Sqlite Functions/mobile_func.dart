// ignore_for_file: avoid_print

import 'package:onlineshop/models/backend/classes.dart';
import 'package:sqflite/sqflite.dart';

Future<void> addMobile(Mobile mobile, Database database) async {
  try {
    int res = await database.insert('Mobile', mobile.toMap());
    print('res = $res');
  } catch (e) {
    print('Error: $e');
  }
}