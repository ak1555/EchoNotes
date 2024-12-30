// import 'package:echonote/homepage.dart';
// import 'package:echonote/listTask.dart';
// import 'package:echonote/smple.dart';
// import 'package:echonote/textTask.dart';
import 'package:echonotes/readpage.dart';
import 'package:echonotes/smple.dart';
import 'package:flutter/material.dart';
// import 'package:hive_flutter/adapters.dart';
// import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
  await Hive.initFlutter();
  var box=await Hive.openBox('mybox');
  runApp( MaterialApp(
    
    home: Smple(),
    // home: ListTask(),
    routes: {
      "readpage":(context)=>ReadPage()
    },
  )  );
}