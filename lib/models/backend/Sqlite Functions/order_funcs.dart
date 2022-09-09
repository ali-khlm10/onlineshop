// ignore_for_file: avoid_print

import 'package:onlineshop/models/backend/Sqlite%20Functions/sqlite_funcs.dart';
import 'package:onlineshop/models/backend/classes.dart';
import 'package:sqflite/sqflite.dart';

Future<bool> addOrders(List<Order> orders) async {
  try {
    Database database = await openDB();
    for (var element in orders) {
      int res = await database.insert('Orders', element.toMap());
      print('res = $res');
    }
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

Future<List<Map<String, Object?>>> getOrder(int orderId) async {
  // productName, brand, price
  try {
    Database database = await openDB();
    List<Map<String, Object?>> productId = await database.query(
      'Orders',
      where: 'orderId = ?',
      whereArgs: [orderId],
      columns: ['productId'],
    );
    List<Map<String, Object?>> data = await database.query(
      'Mobile',
      where: 'productId = ?',
      whereArgs: [productId[0]['productId']],
      columns: ['name', 'catName', 'price'],
    );
    await database.close();
    return data;
  } catch (e) {
    print('Error: $e');
    return [];
  }
}
