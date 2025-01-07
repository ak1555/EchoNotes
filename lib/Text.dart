import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hive_flutter/adapters.dart';

class HIpage extends StatefulWidget {
  const HIpage({super.key});

  @override
  State<HIpage> createState() => _HIpageState();
}

class _HIpageState extends State<HIpage> {
  var mybox = Hive.box('mybox');
  List ls = [];
  @override
  void initfun() {
    if (mybox.get(1) != null) {
      setState(() {
        ls = mybox.get(1);
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
      },
    );
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    initfun();
    tmer();
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
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "readpage",
                      arguments: index.toString());
                },
                child: Container(
                  padding:
                      EdgeInsets.only(left: 8, top: 5, bottom: 5, right: 5),
                  decoration: BoxDecoration(
                      color: Colors.red.shade300,
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DropdownButton<String>(
                            underline: Container(
                              height: 0,
                            ),

                            hint: Container(
                              width: 110,
                              child: Text(
                                ls[index]['title'].toString(),
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                    fontSize: 19,
                                    letterSpacing: 1),
                              ),
                            ),

                            // value: selectedValue,
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
                                              backgroundColor:
                                                  Colors.greenAccent.shade700,
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
                                                    cursorColor: Colors.green,
                                                    decoration: InputDecoration(
                                                        labelText: "Title",
                                                        labelStyle: TextStyle(
                                                            color: Colors.green,
                                                            fontSize: 20),
                                                        focusedBorder:
                                                            OutlineInputBorder(
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
                                                        // maxLines: 35,
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
                                                                  fontSize: 20,
                                                                ),
                                                                focusedBorder: OutlineInputBorder(
                                                                    borderSide: BorderSide(
                                                                        width:
                                                                            2,
                                                                        color: Colors
                                                                            .green)),
                                                                border: OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                            color:
                                                                                Colors.green))),
                                                      )),
                                                  Container(
                                                    height: 100,
                                                    width: double.infinity,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
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
                                                              mybox.put(3, ls);
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: Text("OK",
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold)))
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
                                      ls.removeAt(index);
                                      mybox.put(1, ls);
                                    },
                                    child: Text('Delete')),
                              ),
                            ],
                            onChanged: (String? newValue) {
                              setState(() {
                                // selectedValue = newValue;
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text('Selected: $newValue')),
                                );
                              });
                            },
                          ),
                        ],
                      ),
                      // SizedBox(height: 2,),

                      Text(ls[index]['description'].toString(),
                          maxLines: 10,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                              // color: Colors.black87,
                              letterSpacing: 0)),
                      SizedBox(
                        height: 2,
                      ),
                    ],
                  ),
                ),
              );
            },
          )),
    );
  }
}
