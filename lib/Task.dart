import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hive_flutter/adapters.dart';

class Ooipage extends StatefulWidget {
  const Ooipage({super.key});

  @override
  State<Ooipage> createState() => _OoipageState();
}

class _OoipageState extends State<Ooipage> {
  var mybox = Hive.box('mybox');
  List ls = [];
  List ll = [];
  List llll = [];
  List listlll = [];
  @override
  void initfun() {
    if (mybox.get(3) != null) {
      setState(() {
        ls = mybox.get(3);
      });
    }
  }

  Timer? _timer;

  void tmer() {
    _timer = Timer.periodic(
      Duration(seconds: 1),
      (timer) {
        // getdata();
        initfun();
        // a();
      },
    );
  }

  void a() {
    ll = List.generate(ls.length, (index) => false);
    ChangeNotifier();
  }

  void toColor() {
    llll = List.generate(ls.length, (index) => false);
  }

  void vv() {
    listlll = List.generate(ls.length, (index) => false);
    // print(listlll);
    List o = [];

    try {
      List o = [];
      // print(o.length);
      if (mybox.get(11) != null) {
        o = mybox.get(11);
        for (int i = 0; i <= o.length; i++) {
          // print(i);
          if (o[i] == true) {
            listlll[i] = true;
          }
        }
      }
    } catch (e) {
      print(e);
    }
    // print(listlll);
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    initfun();
    // tmer();
    a();
    toColor();
    vv();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: double.infinity,
            width: double.infinity,
            padding: EdgeInsets.only(left: 7, right: 7),
            child: MasonryGridView.builder(
              itemCount: ls.length,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, index) {
                try {
                  int day = ls[index]["day"];
                  int month = ls[index]["month"];
                  int year = ls[index]["year"];
                  if (day > DateTime.now().day) {
                    if (month >= DateTime.now().month) {
                      if (year >= DateTime.now().year) {
                        llll[index] = true;
                      }
                    }
                  }
                } catch (e) {
                  print(e);
                }
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "task",
                        arguments: index.toString());
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: llll[index]
                            ? listlll[index]
                                ? Colors.green.shade300
                                : Colors.blue.shade300
                            : Colors.red.shade300,
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 1,
                            ),
                            Text(
                              ls[index]['title'].toString(),
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  letterSpacing: 1),
                            ),
                            IconButton(
                              padding: EdgeInsets.all(0),
                              onPressed: () {
                                setState(() {
                                  ll[index] = !ll[index];
                                });
                              },
                              icon: ll[index]
                                  ? Icon(Icons.keyboard_arrow_up)
                                  : Icon(Icons.keyboard_arrow_down_outlined),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 1,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 5),
                          width: double.infinity,
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    ls[index]["date"].toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13),
                                  ),
                                  Text(ls[index]["time"].toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13)),
                                ],
                              ),
                              DropdownButton<String>(
                                underline: Container(
                                  height: 0,
                                ),
                                items: [
                                  DropdownMenuItem(
                                    value: 'Edit',
                                    child: GestureDetector(
                                        onTap: () {
                                          TextEditingController ti =
                                              TextEditingController();
                                          TextEditingController ti2 =
                                              TextEditingController();
                                          setState(() {
                                            ti.text = ls[index]["title"];
                                            ti2.text = ls[index]["description"];
                                          });

                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              return Scaffold(
                                                appBar: AppBar(
                                                  title: Text("Edit",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white)),
                                                  backgroundColor: Colors
                                                      .greenAccent.shade700,
                                                ),
                                                body: Container(
                                                  height: double.infinity,
                                                  width: double.infinity,
                                                  padding: EdgeInsets.all(15),
                                                  child: Column(
                                                    children: [
                                                      Flexible(
                                                          // flex: 1,
                                                          child: TextField(
                                                        controller: ti,
                                                        cursorColor:
                                                            Colors.green,
                                                        decoration: InputDecoration(
                                                            labelText: "Title",
                                                            labelStyle:
                                                                TextStyle(
                                                                    color: Colors
                                                                        .green,
                                                                    fontSize:
                                                                        20),
                                                            focusedBorder: OutlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    width: 2,
                                                                    color: Colors
                                                                        .green)),
                                                            border: OutlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .green))),
                                                      )),
                                                      SizedBox(
                                                        height: 15,
                                                      ),
                                                      Expanded(
                                                          flex: 2,
                                                          child: TextField(
                                                            controller: ti2,
                                                            maxLines: 35,
                                                            cursorColor:
                                                                Colors.green,
                                                            decoration:
                                                                InputDecoration(
                                                                    alignLabelWithHint:
                                                                        true,
                                                                    labelText:
                                                                        "Description",
                                                                    labelStyle:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .green,
                                                                      fontSize:
                                                                          20,
                                                                    ),
                                                                    focusedBorder: OutlineInputBorder(
                                                                        borderSide: BorderSide(
                                                                            width:
                                                                                2,
                                                                            color: Colors
                                                                                .green)),
                                                                    border: OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(color: Colors.green))),
                                                          )),
                                                      Container(
                                                        height: 100,
                                                        width: double.infinity,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: [
                                                            TextButton(
                                                                onPressed: () {
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child: Text(
                                                                  "CANCEL",
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                )),
                                                            TextButton(
                                                                onPressed: () {
                                                                  ls[index][
                                                                          "title"] =
                                                                      ti.text;
                                                                  ls[index][
                                                                          "description"] =
                                                                      ti2.text;
                                                                  mybox.put(
                                                                      3, ls);
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child: Text(
                                                                    "OK",
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold)))
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        child: Text('Edit')),
                                  ),
                                  DropdownMenuItem(
                                    value: 'Delete',
                                    child: GestureDetector(
                                        onTap: () {
                                          print("$index deleteddddddddddddd");
                                          ls.removeAt(index);
                                          mybox.put(3, ls);
                                          List m = mybox.get(11);
                                          m.removeAt(index);
                                          mybox.put(11, m);
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                                content: Text('Task Deleted')),
                                          );
                                        },
                                        child: Text('Delete')),
                                  ),
                                ],
                                onChanged: (String? newValue) {
                                  setState(() {});
                                },
                              ),
                            ],
                          ),
                        ),
                        //..................
                        SizedBox(height: ll[index] ? 8 : 0),
                        //..................
                        ll[index]
                            ? Text(ls[index]['description'].toString(),
                                maxLines: 5,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                    overflow: TextOverflow.ellipsis,
                                    letterSpacing: 0))
                            : SizedBox(
                                height: 0,
                              ),
                        //..................
                        SizedBox(height: ll[index] ? 10 : 1),
                        //..................
                        ll[index]
                            ? llll[index]
                                ? TextButton(
                                    onPressed: () {
                                      listlll[index] = true;
                                      mybox.put(11, listlll);
                                    },
                                    child: Text(
                                        listlll[index]
                                            ? "completed"
                                            : "Mark as done",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontSize: 13)))
                                : Text("Task ended",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13))
                            : SizedBox(
                                height: 1,
                              ),
                        SizedBox(
                          height: ll[index] ? 8 : 0,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ))
        // Center(child: Text("task"),),
        );
  }
}




























// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// import 'package:hive_flutter/adapters.dart';

// class Ooipage extends StatefulWidget {
//   const Ooipage({super.key});

//   @override
//   State<Ooipage> createState() => _OoipageState();
// }

// class _OoipageState extends State<Ooipage> {
//   var mybox = Hive.box('mybox');
//   List ls = [];
//   List ll=[];
//   @override
//   void initfun() {
//     if (mybox.get(3) != null) {
//       setState(() {
//         ls = mybox.get(3);
//       });
//     }
//   }

//   Timer? _timer;

//   void tmer() {
//     _timer = Timer.periodic(
//       Duration(seconds: 1),
//       (timer) {
//         // getdata();
//         initfun();
//         // a();
//       },
//     );
//   }
//  void a(){
//    ll = List.generate(ls.length, (index) => false);
//    ChangeNotifier();
//  }

//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     initfun();
//     // tmer();
//     a();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Container(
//             height: double.infinity,
//             width: double.infinity,
//             child: MasonryGridView.builder(
//               itemCount: ls.length,
//               mainAxisSpacing: 5,
//               crossAxisSpacing: 5,
//               gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2),
//               itemBuilder: (context, index) {
               
//               return  GestureDetector(
//                   onTap: () {
//                     Navigator.pushNamed(context, "task",
//                         arguments: index.toString());
//                   },
//                   child: Container(
//                     padding: EdgeInsets.all(5),
//                     decoration: BoxDecoration(
//                         color: Colors.red.shade300,
//                         borderRadius: BorderRadius.circular(15)),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             SizedBox(
//                               width: 1,
//                             ),
//                             Text(
//                               ls[index]['title'].toString(),
//                               overflow: TextOverflow.ellipsis,
//                               style: TextStyle(
//                                   fontWeight: FontWeight.w600,
//                                   fontSize: 18,
//                                   letterSpacing: 1),
//                             ),
//                             IconButton(
//                               padding: EdgeInsets.all(0),
//                               onPressed: () {
//                                 setState(() {
//                                   ll[index]=!ll[index];
//                                 });
//                               },
//                               icon:ll[index]? Icon(Icons.keyboard_arrow_down_outlined):Icon(Icons.keyboard_arrow_up),
//                             )
//                           ],
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
                   
//                         // SizedBox(
//                         //   height: 8,
//                         // ),
//                         Container(
//                           padding: EdgeInsets.only(left: 5),
//                           width: double.infinity,
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 ls[index]["date"].toString(),
//                                 style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),
//                               ),
//                               Text(ls[index]["time"].toString(),
//                                   style:
//                                       TextStyle(fontWeight: FontWeight.bold,fontSize: 13)),
//                             ],
//                           ),
//                         ),
//                         SizedBox(height: 10,),
//                            ll[index]?  Text(ls[index]['description'].toString(),
//                             maxLines: 5,
//                             style: TextStyle(
//                                 fontWeight: FontWeight.w500,
//                                 fontSize: 17,
//                                 overflow: TextOverflow.ellipsis,
//                                 letterSpacing: 0)):SizedBox(height: 1,),
//                                 SizedBox(height: 10,),
//                                ll[index]?  Text("Task ended",
//                                   style:
//                                       TextStyle(fontWeight: FontWeight.bold,fontSize: 13)):SizedBox(height: 1,),
//                                 SizedBox(height: ll[index]? 8:0,),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ))
//         // Center(child: Text("task"),),
//         );
//   }
// }