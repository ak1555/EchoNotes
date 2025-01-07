import 'package:echonotes/readList.dart';
import 'package:echonotes/readText.dart';
import 'package:echonotes/homepage.dart';
import 'package:echonotes/readTask.dart';
import 'package:echonotes/z.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox('mybox');
  runApp(MaterialApp(
    home: Smple(),
    // home: CalendarPage(),

    routes: {
      "readpage": (context) => ReadPage(),
      "list": (context) => ListRead(),
      "task": (context) => TaskRead(),
    },
  ));
}
