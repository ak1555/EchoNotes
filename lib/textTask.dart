import 'dart:async';

import 'package:flutter/material.dart';

class TextTasks extends StatefulWidget {
  const TextTasks({super.key});

  @override
  State<TextTasks> createState() => _TextTasksState();
}

class _TextTasksState extends State<TextTasks> {
  Timer? _timer;
   var tme;
String? date;
// void frequentupdate(){
//   _timer=Timer.periodic(Duration(seconds: 1), (timer) {
//     settime();
//   },);
// }

  void settime(){
   setState(() {
  // DateTime dateToday =new DateTime.now(); 
  DateTime dateToday =new DateTime.now(); 
   date = dateToday.toString().substring(0,10);
  }
  );
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
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            SizedBox(height: 15,),
            Container(
              height: 100,
              child: Expanded(
                  flex: 1,
                  child: TextField(
                    
                            cursorColor: Colors.green,
                    decoration: InputDecoration(
                          labelText: "Title",
                labelStyle: TextStyle(color: Colors.green,fontSize: 20),
                                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 2,color: Colors.green)),

                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                  )),
            ),
            Expanded(
                child: TextField(
              maxLines: 30,
              cursorColor: Colors.green,
              decoration: InputDecoration(alignLabelWithHint: true,
                labelText: "Description",
                labelStyle: TextStyle(color: Colors.green,fontSize: 20,),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 2,color: Colors.green)),
                  border: OutlineInputBorder(
                    
                      borderSide: BorderSide(color: Colors.green))),
            )),
            Container(
              height: 80,
              width: double.infinity,
              padding: EdgeInsets.only(left: 15,right: 15),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(date.toString(),style: TextStyle(color: Colors.green)),
                  Text("data",style: TextStyle(color: Colors.green),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
