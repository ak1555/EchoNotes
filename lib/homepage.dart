// import 'package:echonote/hey.dart';
// import 'package:echonote/hi.dart';
// import 'package:echonote/listTask.dart';
// import 'package:echonote/ooi.dart';
// import 'package:echonote/taskTask.dart';
// import 'package:echonote/textTask.dart';
// import 'package:flutter/material.dart';


// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       home: MyCustomTab(),
//       // theme: ThemeData(scaffoldBackgroundColor: Colors.green.shade100),
//     );
//   }
// }

// class MyCustomTab extends StatefulWidget {
//   const MyCustomTab({super.key});

//   @override
//   State<MyCustomTab> createState() => _MyCustomTabState();
// }

// class _MyCustomTabState extends State<MyCustomTab> {

//   bool t=false;
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 4,
//       child: Scaffold(
//         // backgroundColor: Colors.green.shade600,
//         // appBar: AppBar(
//         //   title: Text("Custom Tap"),
//         // ),
//         body: Container(
//           // padding: const EdgeInsets.all(8.0),
//           color: Colors.green.shade600,
//           child: Column(
//             // mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(
//                 height: 32,
//               ),
//               Text(
//                 "   Echo Notes",
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 23),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Container(
//                 height: 50,
//                 child: TabBar(
//                   indicator: BoxDecoration(

//                       // color: Colors.white,

//                       // borderRadius: BorderRadius.circular(20),
//                       ),
//                   labelColor: Colors.white,
//                   indicatorColor: Colors.white,
//                   labelStyle:
//                       TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//                   dividerColor: Colors.black,
//                   tabs: [
//                     Tab(
//                       text: "Text",
//                     ),
//                     Tab(
//                       text: "List",
//                     ),
//                     Tab(
//                       text: "Task",
//                     ),
//                   ],
//                 ),
//               ),
//               Expanded(
//                 child: TabBarView(children: [HIpage(), Heypage(), Ooipage()]),
//               )
//             ],
//           ),
//         ),
//         floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
//         floatingActionButton:t? Column(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             FloatingActionButton.small(
//               onPressed: () {
//                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => TextTasks(),));
//               },
//               backgroundColor: Colors.green.shade600,
//               child: Icon(
//                 // Icons.note_alt_outlined,
//                 Icons.task_alt_outlined
//                 // size: 35,
//               ),
//             ),
//              FloatingActionButton.small(
//               onPressed: () {
//                Navigator.of(context).push(MaterialPageRoute(builder: (context) => ListTask(),));
//               },
//               backgroundColor: Colors.green.shade600,
//               child: Icon(
//                 Icons.format_list_numbered_rtl_rounded,
//                 // size: 35,
//               ),
//             ),
//              FloatingActionButton(
//               onPressed: () {
//                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => TaskTask(),));
//               },
//               backgroundColor: Colors.green.shade600,
//               child: Icon(
//                 Icons.description,
//                color: Colors.black,
//               ),
//             ),
//           ],
//         ):FloatingActionButton(
//           backgroundColor: Colors.green,
//           onPressed: () {
//           setState(() {
//             t=true;
//           });
//         },child: Icon(Icons.add,size: 35,),),
//       ),
//     );
//   }
// }
