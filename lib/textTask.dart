import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class TextTasks extends StatefulWidget {
  const TextTasks({super.key});

  @override
  State<TextTasks> createState() => _TextTasksState();
}

class _TextTasksState extends State<TextTasks> {
  TextEditingController contoller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  var mybox = Hive.box('mybox');
  Map mp = {};
  List ls = [];
  // Timer? _timer;e4
  //  var tme;
// String? date;
// void frequentupdate(){
//   _timer=Timer.periodic(Duration(minutes: 1), (timer) {
//     settime();
//   },);
// }
  var minute;
  var hour;
  var day;
  var month;
  var year;

  void settime() {
    setState(() {
      day = DateTime.now().day;
      hour = DateTime.now().hour;
      minute = DateTime.now().minute;
      month = DateTime.now().month;
      year = DateTime.now().year;
      //  date = dateToday.toString().substring(0,10);
      print(day);
      print(month);
      print(year);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    settime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          "Add New Task",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              letterSpacing: 1),
        ),
        actions: [
          IconButton(
              onPressed: () {
                if (contoller1.text.isNotEmpty) {
                  if (mybox.get(1) == null) {
                    mp = {
                      "title": contoller1.text,
                      "description": controller2.text
                    };
                    ls.add(mp);
                    mybox.put(1, ls);
                  } else {
                    ls = mybox.get(1);
                    mp = {
                      "title": contoller1.text,
                      "description": controller2.text
                    };
                    ls.add(mp);
                    mybox.put(1, ls);
                  }

                  contoller1.clear();
                  controller2.clear();
                  Navigator.pop(context);
                } else {
                  // showBottomSheet(context: context, builder: (context) {
                  // },);
                }
              },
              icon: Icon(
                Icons.check,
                color: Colors.white,
              ))
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 100,
              child: Expanded(
                  flex: 1,
                  child: TextField(
                    controller: contoller1,
                    cursorColor: Colors.green,
                    decoration: InputDecoration(
                        labelText: "Title",
                        labelStyle:
                            TextStyle(color: Colors.green, fontSize: 20),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Colors.green)),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                  )),
            ),
            Expanded(
                child: TextField(
              controller: controller2,
              maxLines: 30,
              cursorColor: Colors.green,
              decoration: InputDecoration(
                  alignLabelWithHint: true,
                  labelText: "Description",
                  labelStyle: TextStyle(
                    color: Colors.green,
                    fontSize: 20,
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Colors.green)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green))),
            )),
            Container(
              height: 80,
              width: double.infinity,
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("$day-$month-$year".toString(),
                      style: TextStyle(color: Colors.green)),
                  Text(
                    "$hour:$minute",
                    style: TextStyle(color: Colors.green),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
