import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import './data_model.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;

import 'Modules/home_screen/home_screen.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  /// root of Hive.
  Directory directory = await pathProvider.getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(DataModelAdapter());
  await Hive.openBox('hive_box');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      title: 'Hive Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
