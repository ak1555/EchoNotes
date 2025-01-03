// import 'package:flutter/material.dart';
// import 'package:table_calendar/table_calendar.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: CalendarPage(),
//     );
//   }
// }

// class CalendarPage extends StatefulWidget {
//   @override
//   _CalendarPageState createState() => _CalendarPageState();
// }

// class _CalendarPageState extends State<CalendarPage> {
//   DateTime _selectedDay = DateTime.now();
//   DateTime _focusedDay = DateTime.now();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Calendar Example"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             TableCalendar(
//               focusedDay: _focusedDay,
//               firstDay: DateTime.utc(2000, 1, 1),
//               lastDay: DateTime.utc(2100, 12, 31),
//               selectedDayPredicate: (day) {
//                 return isSameDay(_selectedDay, day);
//               },
//               onDaySelected: (selectedDay, focusedDay) {
//                 setState(() {
//                   _selectedDay = selectedDay;
//                   _focusedDay = focusedDay; // Update focused day as well
//                 });
//               },
//               calendarStyle: CalendarStyle(
//                 selectedDecoration: BoxDecoration(
//                   color: Colors.blue,
//                   shape: BoxShape.circle,
//                 ),
//                 todayDecoration: BoxDecoration(
//                   color: Colors.orange,
//                   shape: BoxShape.circle,
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             Text(
//               "Selected Day: ${_selectedDay.toLocal()}",
//               style: TextStyle(fontSize: 16),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class ListEdit extends StatefulWidget {
  const ListEdit({super.key});

  @override
  State<ListEdit> createState() => _ListEditState();
}

class _ListEditState extends State<ListEdit> {
  TextEditingController ti = TextEditingController();
  TextEditingController ti2 = TextEditingController();
var mybox=Hive.box('mybox');
  int? i;
  List ls = [];
  List li = [];
  List llii = [];
  List<bool> ll = [];
 void getdata(){
    if(mybox.get(2)!=null){
      setState(() {
        ls=mybox.get(2);
      });
    try {
        setState(() {
          li=ls[i!]['description'];
          
        });
        for(int i=0;i<=li.length;i++){
          // mp[i]={li[i]:false};
            ll = List.generate(li.length, (index) => false);
        }
    } catch (e) {
      print(e);
    }
      // li=mp['descri']
      // print(li);
    }
  }



  void gettdata() {

    setState(() {
      ti.text = ls[i!]["title"];
      // ti2.text=ls[i!]["description"];
      llii = ls[i!]["description"];
    });
  }

  @override
  Widget build(BuildContext context) {
    i = int.parse(ModalRoute.of(context)?.settings.arguments as String);
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: Colors.greenAccent.shade700,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            SizedBox(
              height: 80,
              child: Expanded(
                  flex: 1,
                  child: TextField(
                    controller: ti,
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
            SizedBox(
              height: 80,
              // color: Colors.pink,
              child: Expanded(
                  child: TextField(
                controller: ti2,
                // maxLines: 30,
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
                        borderSide: BorderSide(color: Colors.green)),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            llii.add(ti2.text);
                            ti2.clear();
                            print(llii);
                          });
                        },
                        icon: Icon(
                          Icons.add,
                          color: Colors.green,
                          size: 30,
                        ))),
              )),
            ),
            Expanded(
                child: ListView.builder(
              itemCount: llii.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    llii[index].toString(),
                    style: TextStyle(fontSize: 20),
                  ),
                  trailing: IconButton(
                      onPressed: () {
                        setState(() {
                          llii.removeAt(index);
                        });
                      },
                      icon: Icon(Icons.close)),
                );
              },
            )),
            Container(
              height: 100,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "CANCEL",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                  TextButton(
                      onPressed: () {
                        ls[i!]["title"] = ti.text;
                        ls[i!]["description"] = llii;
                        mybox.put(2, ls);
                        Navigator.pop(context);
                      },
                      child: Text("OK",
                          style: TextStyle(fontWeight: FontWeight.bold)))
                ],
              ),
            )
          ],
        ),
      ),
    );
    ;
  }
}
