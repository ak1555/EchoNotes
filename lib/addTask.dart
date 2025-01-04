// import 'dart:async';

import 'package:echonotes/Task.dart';
import 'package:echonotes/z.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:table_calendar/table_calendar.dart';
// import 'package:hive/hive.dart';

class TaskTask extends StatefulWidget {
  const TaskTask({super.key});

  @override
  State<TaskTask> createState() => _TaskTaskState();
}

class _TaskTaskState extends State<TaskTask> {
  TextEditingController contoller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  var mybox = Hive.box('mybox');

  List ls = [];
  Map mp = {};
  var minute;
  var hour;
  var day;
  var month;
  var year;
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  void settime() {
    setState(() {
      day = DateTime.now().day.toString().padLeft(2,'0');
      hour = DateTime.now().hour.toString().padLeft(2,'0');
      minute = DateTime.now().minute.toString().padLeft(2,'0');
      month = DateTime.now().month.toString().padLeft(2,'0');
      year = DateTime.now().year;
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
    // frequentupdate();
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
                String t = "$hour:$minute".toString();
                String d = "$day-$month-$year".toString();
                if (mybox.get(3) == null) {
                  mp = {
                    "title": contoller1.text,
                    "description": controller2.text,
                    "time": t,
                    "date": d
                  };
                  ls.add(mp);
                  mybox.put(3, ls);
                } else {
                  ls = mybox.get(3);
                  mp = {
                    "title": contoller1.text,
                    "description": controller2.text,
                    "time": t,
                    "date": d
                  };
                  ls.add(mp);
                  mybox.put(3, ls);
                }
                contoller1.clear();
                controller2.clear();
                // Navigator.pop(context);
                Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => Ooipage(),));
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
        padding: EdgeInsets.all(8),
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
                  GestureDetector(
                    onTap: () {
                      showDialog(context: context, builder: (context) {
                        return
                        //  AlertDialog(
                        //   title: 
                          Scaffold(
                            body: Container(
                              height: double.infinity,
                              width: double.infinity,
                              padding: EdgeInsets.all(8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TableCalendar(
                                  focusedDay: _focusedDay,
                                  firstDay: DateTime.utc(2000, 1, 1),
                                  lastDay: DateTime.utc(2100, 12, 31),
                                  selectedDayPredicate: (day) {
                                    return isSameDay(_selectedDay, day);
                                  },
                                  onDaySelected: (selectedDay, focusedDay) {
                                    print(selectedDay.day);
                                    setState(() {
                                      _selectedDay = selectedDay;
                                      _focusedDay = focusedDay; // Update focused day as well
                                      day=selectedDay.day;
                                      month=selectedDay.month;
                                      year=selectedDay.year;
                                    });
                                  },
                                  calendarStyle: CalendarStyle(
                                    selectedDecoration: BoxDecoration(
                                      color: Colors.blue,
                                      shape: BoxShape.circle,
                                    ),
                                    todayDecoration: BoxDecoration(
                                      color: Colors.orange,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20),
                                Text(
                                  // "Selected Day: ${_selectedDay.toLocal()}",
                                  "Selected Day: ${_selectedDay.day}",
                                  style: TextStyle(fontSize: 16),
                                ),
                                      Container(
                                        height: 65,
                                        width: double.infinity,
                                        child: TextButton(style: TextButton.styleFrom(
                                          backgroundColor: Colors.greenAccent.shade700
                                        ),
                                          onPressed: () {
                                                                      Navigator.pop(context);
                                                                    }, child: Text('OK')),
                                      )
                              ],
                            ),
                          ),
                          );
                        //   actions: [
                        //     TextButton(onPressed: () {
                        //       Navigator.pop(context);
                        //     }, child: Text('OK'))
                        //   ],
                        // );
                      },);
                    },
                    child: Text("$day-$month-$year".toString(),
                        style: TextStyle(color: Colors.green)),
                  ),

                  GestureDetector(
                    // onTap: 
                    child: Text(
                      "$hour:$minute",
                      style: TextStyle(color: Colors.green),
                    ),
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
