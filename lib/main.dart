import 'package:echonote/homepage.dart';
import 'package:echonote/listTask.dart';
import 'package:echonote/smple.dart';
import 'package:echonote/textTask.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
  await Hive.initFlutter();
  var box=await Hive.box('mybox');
  runApp( MaterialApp(
    
    home: Smple(),
    // home: ListTask(),
  )  );
}