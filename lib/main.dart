// ignore_for_file: avoid_print, unused_local_variable

import 'package:flutter/material.dart';
import 'package:onlineshop/models/backend/Sqlite%20Functions/admin_funcs.dart';
import 'package:onlineshop/models/backend/classes.dart';
import 'package:onlineshop/models/frontend/homepage.dart';
import 'package:sqflite/sqflite.dart';
import 'models/backend/Sqlite Functions/sqlite_funcs.dart';

Future<void> main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
  } catch (e) {
    print('ErrorS: $e');
  }

  try {
    Database db = await openDB();
  } catch (e) {
    print('ErrorS1: $e');
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // home: homePage(),
      home: App(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () async {
        List data = await getAllAdmins();
        print(data);
        await updateAdminPassword('Pooya', '7475');
        data = await getAllAdmins();
        print(data);
      }),
    );
  }
}
