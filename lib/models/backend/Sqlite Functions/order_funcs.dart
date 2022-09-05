// ignore_for_file: avoid_print

import 'package:onlineshop/models/backend/classes.dart';
import 'package:sqflite/sqflite.dart';

Future<void> addOrder(Order order, Database database) async {
  try {
    int res = await database.insert('CameraCat', order.toMap());
    print('res = $res');
  } catch (e) {
    print('Error: $e');
  }
}