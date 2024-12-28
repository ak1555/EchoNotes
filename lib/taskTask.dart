import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class TaskTask extends StatefulWidget {
  const TaskTask({super.key});

  @override
  State<TaskTask> createState() => _TaskTaskState();
}

class _TaskTaskState extends State<TaskTask> {
    TextEditingController contoller1= TextEditingController();
  TextEditingController controller2=TextEditingController();
  var mybox=Hive.box('mybox');
    List li=[];
      List ls=[];
        Map mp={};
//   Timer? _timer;
//   //  var tme;
// // String? date;
// void frequentupdate(){
//   _timer=Timer.periodic(Duration(minutes: 1), (timer) {
//     settime();
//   },);
// }
// var minute;
// var hour;
// var day;
// var month;
// var year;

//   void settime(){
//    setState(() {

//   day= DateTime.now().day; 
//   hour = DateTime.now().hour; 
//   minute = DateTime.now().minute; 
//   month = DateTime.now().month; 
//   year = DateTime.now().year; 
//   //  date = dateToday.toString().substring(0,10);
//   print(day);
//   print(month);
//   print(year);
//   }
//   );
//   }
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     settime();
//     frequentupdate();
//   }

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
        actions: [IconButton(onPressed: () {
           if(li!=null){

            if(mybox.get(2)==null){
              mp={"title":contoller1.text,"description":li};
            ls.add(mp);
            mybox.put(2, ls);
            }else{
              ls=mybox.get(2);
              mp={"title":contoller1.text,"description":li};
            ls.add(mp);
            mybox.put(2, ls);
            }

          }
        }, icon: Icon(Icons.check))],
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
            // Container(
            //   height: 80,
            //   width: double.infinity,
            //   padding: EdgeInsets.only(left: 15,right: 15),
            //   child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Text("$day-$month-$year".toString(),style: TextStyle(color: Colors.green)),
            //       Text("$hour:$minute",style: TextStyle(color: Colors.green),)
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
