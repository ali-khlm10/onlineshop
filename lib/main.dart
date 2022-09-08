// ignore_for_file: avoid_print, unused_local_variable

import 'package:flutter/material.dart';
import 'package:onlineshop/models/backend/Sqlite%20Functions/admin_funcs.dart';
import 'package:onlineshop/models/backend/Sqlite%20Functions/mobile_func.dart';
import 'package:onlineshop/models/frontend/shop%20home%20page/homepage.dart';
import 'package:sqflite/sqflite.dart';
import 'models/backend/Sqlite Functions/mobile_cat_funcs.dart';
import 'models/backend/Sqlite Functions/sqlite_funcs.dart';
import 'models/frontend/constants.dart';

Future<void> main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
  } catch (e) {
    print('ErrorS: $e');
  }

  try {
    Database db = await openDB();
    await addAdmin('admin', 'admin');
    await addAdmin('admin1', 'admin1');
    print(await aa('admin'));
  } catch (e) {
    print('ErrorS1: $e');
  }
  list_mobile_cats = await getAllMobileCats();
  list_of_products_for_mobile = await getAllMobiles();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: homePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
