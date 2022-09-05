// ignore_for_file: avoid_print

import 'package:onlineshop/models/backend/classes.dart';
import 'package:sqflite/sqflite.dart';

Future<void> addCamera(Camera camera, Database database) async {
  try {
    int res = await database.insert('Camera', camera.toMap());
    print('res = $res');
  } catch (e) {
    print('Error : $e');
  }
}