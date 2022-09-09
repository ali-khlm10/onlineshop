// ignore_for_file: avoid_print

import 'package:onlineshop/models/backend/Sqlite%20Functions/sqlite_funcs.dart';
import 'package:onlineshop/models/backend/classes.dart';
import 'package:sqflite/sqflite.dart';

Future<bool> addOrder(Order order) async {
  try {
    Database database = await openDB();
    int res = await database.insert('Orders', order.toMap());
    print('res = $res');
    await database.close();
    return true;
  } catch (e) {
    print('Error: $e');
    return false;
  }
}

Future<bool> deleteOrder(int orderId) async {
  try {
    Database database = await openDB();
    await database.delete(
      'Orders',
      where: 'orderId = ?',
      whereArgs: [orderId],
    );
    await database.close();
    return true;
  } catch (e) {
    print('Error: $e');
    return false;
  }
}

Future<List<Map<String, Object?>>> getAllOrders() async {
  try {
    Database database = await openDB();
    List<Map<String, Object?>> data = await database.query('Orders');
    await database.close();
    return data;
  } catch (e) {
    print('Error: $e');
    return [];
  }
}

Future<List<Map<String, Object?>>> getOrders(int orderId) async {
  try {
    Database database = await openDB();
    List<Map<String, Object?>> data = await database.query(
      'Orders',
      where: 'orderId = ?',
      whereArgs: [orderId],
    );
    // data[0].
    await database.close();
    return data;
  } catch (e) {
    print('Error: $e');
    return [];
  }
}
