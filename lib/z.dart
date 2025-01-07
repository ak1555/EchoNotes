import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

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

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calendar Example"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TableCalendar(
              focusedDay: _focusedDay,
              firstDay: DateTime.utc(2000, 1, 1),
              lastDay: DateTime.utc(2100, 12, 31),
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay; // Update focused day as well
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
          ],
        ),
      ),
    );
  }
}

// import 'dart:math';
// // import 'package:flutter/material.dart';

// // void main() {
// //   runApp(MyApp());
// // }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: CustomAnalogClock(),
//     );
//   }
// }

// class CustomAnalogClock extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Custom Analog Clock')),
//       body: Center(
//         child: Container(
//           width: 300,
//           height: 300,
//           child: CustomPaint(
//             painter: ClockPainter(),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class ClockPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final center = Offset(size.width / 2, size.height / 2);
//     final radius = min(size.width / 2, size.height / 2);

//     // Draw clock face
//     final paint = Paint()..color = Colors.blueAccent.withOpacity(0.1);
//     canvas.drawCircle(center, radius, paint);

//     // Draw clock hands
//     final now = DateTime.now();
//     final hourHandPaint = Paint()
//       ..color = Colors.black
//       ..strokeWidth = 6
//       ..strokeCap = StrokeCap.round;
//     final minuteHandPaint = Paint()
//       ..color = Colors.black
//       ..strokeWidth = 4
//       ..strokeCap = StrokeCap.round;
//     final secondHandPaint = Paint()
//       ..color = Colors.red
//       ..strokeWidth = 2
//       ..strokeCap = StrokeCap.round;

//     final hourAngle = 2 * pi * (now.hour % 12) / 12 + (2 * pi * now.minute) / (12 * 60);
//     final minuteAngle = 2 * pi * now.minute / 60;
//     final secondAngle = 2 * pi * now.second / 60;

//     canvas.drawLine(center, center + Offset(radius * 0.5 * cos(hourAngle - pi / 2), radius * 0.5 * sin(hourAngle - pi / 2)), hourHandPaint);
//     canvas.drawLine(center, center + Offset(radius * 0.7 * cos(minuteAngle - pi / 2), radius * 0.7 * sin(minuteAngle - pi / 2)), minuteHandPaint);
//     canvas.drawLine(center, center + Offset(radius * 0.9 * cos(secondAngle - pi / 2), radius * 0.9 * sin(secondAngle - pi / 2)), secondHandPaint);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
// }

// import 'package:flutter/material.dart';
// import 'package:analog_clock/analog_clock.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: AnalogClockScreen(),
//     );
//   }
// }

// class AnalogClockScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Analog Clock')),
//       body: Center(
//         child: AnalogClock(
//           decoration: BoxDecoration(
//             border: Border.all(width: 2.0, color: Colors.black),
//             shape: BoxShape.circle,
//           ),
//           width: 200.0,
//           isLive: true,
//           hourHandColor: Colors.black,
//           minuteHandColor: Colors.black,
//           showSecondHand: true,
//           numberColor: Colors.black,
//           showNumbers: true,
//           textScaleFactor: 1.5,
//           showTicks: true,
//           showDigitalClock: false,
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:analog_clock_picker/analog_clock_picker.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: TimePickerScreen(),
//     );
//   }
// }


// class TimePickerScreen extends StatefulWidget {
//   @override
//   _TimePickerScreenState createState() => _TimePickerScreenState();
// }

// class _TimePickerScreenState extends State<TimePickerScreen> {
//   TimeOfDay? _selectedTime;

//   void _showAnalogTimePicker(BuildContext context) async {
//     AnalogClockController analogClockController = AnalogClockController();
//     final time = await showDialog<TimeOfDay>(
//       context: context,
//       builder: (BuildContext context) {
//         return
//             //AnalogClockPicker(size: BorderSide.strokeAlignCenter,
//             //   use24HourFormat: false, // Set to true for 24-hour format
//             //   initialTime: TimeOfDay.now(),
//             //   title: Text(
//             //     "Pick a Time",
//             //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             //   ),
//             //   isForce2Digits: true, // Forces single-digit hours to be two digits
//             // );
//             Container(
//           height: 500,
//           width: 500,
//           padding: EdgeInsets.all(25),
//           child: AnalogClockPicker(
//             controller: analogClockController,
//             size: MediaQuery.of(context).size.width * 0.74,
//             // size: 100,
//             secondHandleColor: Colors.red,
//             minutesHandleColor: Colors.black,
//             hourHandleColor: Colors.black,
//             // clockBackground: Image.asset(
//             //   // AssetImage.clockBackground,

//             // ),
//             onClockChange: (date) {
//               //TODO : Do Something
//             },
//           ),
//         );
//       },
//     );

//     if (time != null) {
//       setState(() {
//         _selectedTime = time;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Analog Clock Picker')),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               _selectedTime == null
//                   ? 'No time selected'
//                   : 'Selected Time: ${_selectedTime!.format(context)}',
//               style: TextStyle(fontSize: 24),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () => _showAnalogTimePicker(context),
//               child: Text('Pick Time'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }





















// import 'package:flutter/material.dart';
// import 'package:hive_flutter/adapters.dart';

// class ListEdit extends StatefulWidget {
//   const ListEdit({super.key});

//   @override
//   State<ListEdit> createState() => _ListEditState();
// }

// class _ListEditState extends State<ListEdit> {
//   TextEditingController ti = TextEditingController();
//   TextEditingController ti2 = TextEditingController();
// var mybox=Hive.box('mybox');
//   int? i;
//   List ls = [];
//   List li = [];
//   List llii = [];
//   List<bool> ll = [];
//  void getdata(){
//     if(mybox.get(2)!=null){
//       setState(() {
//         ls=mybox.get(2);
//       });
//     try {
//         setState(() {
//           li=ls[i!]['description'];
          
//         });
//         for(int i=0;i<=li.length;i++){
//           // mp[i]={li[i]:false};
//             ll = List.generate(li.length, (index) => false);
//         }
//     } catch (e) {
//       print(e);
//     }
//       // li=mp['descri']
//       // print(li);
//     }
//   }



//   void gettdata() {

//     setState(() {
//       ti.text = ls[i!]["title"];
//       // ti2.text=ls[i!]["description"];
//       llii = ls[i!]["description"];
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     i = int.parse(ModalRoute.of(context)?.settings.arguments as String);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Edit",
//             style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
//         backgroundColor: Colors.greenAccent.shade700,
//       ),
//       body: Container(
//         height: double.infinity,
//         width: double.infinity,
//         padding: EdgeInsets.all(15),
//         child: Column(
//           children: [
//             SizedBox(
//               height: 80,
//               child: Expanded(
//                   flex: 1,
//                   child: TextField(
//                     controller: ti,
//                     cursorColor: Colors.green,
//                     decoration: InputDecoration(
//                         labelText: "Title",
//                         labelStyle:
//                             TextStyle(color: Colors.green, fontSize: 20),
//                         focusedBorder: OutlineInputBorder(
//                             borderSide:
//                                 BorderSide(width: 2, color: Colors.green)),
//                         border: OutlineInputBorder(
//                             borderSide: BorderSide(color: Colors.green))),
//                   )),
//             ),
//             SizedBox(
//               height: 80,
//               // color: Colors.pink,
//               child: Expanded(
//                   child: TextField(
//                 controller: ti2,
//                 // maxLines: 30,
//                 cursorColor: Colors.green,
//                 decoration: InputDecoration(
//                     alignLabelWithHint: true,
//                     labelText: "Description",
//                     labelStyle: TextStyle(
//                       color: Colors.green,
//                       fontSize: 20,
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                         borderSide: BorderSide(width: 2, color: Colors.green)),
//                     border: OutlineInputBorder(
//                         borderSide: BorderSide(color: Colors.green)),
//                     suffixIcon: IconButton(
//                         onPressed: () {
//                           setState(() {
//                             llii.add(ti2.text);
//                             ti2.clear();
//                             print(llii);
//                           });
//                         },
//                         icon: Icon(
//                           Icons.add,
//                           color: Colors.green,
//                           size: 30,
//                         ))),
//               )),
//             ),
//             Expanded(
//                 child: ListView.builder(
//               itemCount: llii.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(
//                     llii[index].toString(),
//                     style: TextStyle(fontSize: 20),
//                   ),
//                   trailing: IconButton(
//                       onPressed: () {
//                         setState(() {
//                           llii.removeAt(index);
//                         });
//                       },
//                       icon: Icon(Icons.close)),
//                 );
//               },
//             )),
//             Container(
//               height: 100,
//               width: double.infinity,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   TextButton(
//                       onPressed: () {
//                         Navigator.pop(context);
//                       },
//                       child: Text(
//                         "CANCEL",
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       )),
//                   TextButton(
//                       onPressed: () {
//                         ls[i!]["title"] = ti.text;
//                         ls[i!]["description"] = llii;
//                         mybox.put(2, ls);
//                         Navigator.pop(context);
//                       },
//                       child: Text("OK",
//                           style: TextStyle(fontWeight: FontWeight.bold)))
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//     ;
//   }
// }
