// ignore_for_file: avoid_print

import 'package:onlineshop/models/backend/classes.dart';
import 'package:sqflite/sqflite.dart';

Future<void> addMobileCategory(
    MobileCategory mobileCategory, Database database) async {
  try {
    int res = await database.insert('MobileCat', mobileCategory.toMap());
    print('res = $res');
  } catch (e) {
    print('Error : $e');
  }
}