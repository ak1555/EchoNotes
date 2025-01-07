import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class ReadPage extends StatefulWidget {
  const ReadPage({super.key});

  @override
  State<ReadPage> createState() => _ReadPageState();
}

class _ReadPageState extends State<ReadPage> {
  int? i;
  List ls = [];
  var mybox = Hive.box('mybox');
  void getdata() {
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
        getdata();
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
    tmer();
  }

  @override
  @override
  Widget build(BuildContext context) {
    i = int.parse(ModalRoute.of(context)?.settings.arguments as String);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent.shade700,
        foregroundColor: Colors.white,
        title: Center(
          child: Text(ls[i!]["title"].toString(),
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22)),
        ),
        actions: [
          IconButton(
              onPressed: () {
                TextEditingController ti = TextEditingController();
                TextEditingController ti2 = TextEditingController();
                setState(() {
                  ti.text = ls[i!]["title"];
                  ti2.text = ls[i!]["description"];
                });

                showDialog(
                  context: context,
                  builder: (context) {
                    return Scaffold(
                      appBar: AppBar(
                        title: Text(
                          "Edit",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        backgroundColor: Colors.greenAccent.shade700,
                      ),
                      body: Container(
                        height: double.infinity,
                        width: double.infinity,
                        padding: EdgeInsets.all(15),
                        child: Column(
                          children: [
                            Flexible(
                                child: TextField(
                              controller: ti,
                              cursorColor: Colors.green,
                              decoration: InputDecoration(
                                  labelText: "Title",
                                  labelStyle: TextStyle(
                                      color: Colors.green, fontSize: 20),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 2, color: Colors.green)),
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.green))),
                            )),
                            SizedBox(
                              height: 15,
                            ),
                            Expanded(
                                flex: 2,
                                child: TextField(
                                  controller: ti2,
                                  maxLines: 35,
                                  cursorColor: Colors.green,
                                  decoration: InputDecoration(
                                      alignLabelWithHint: true,
                                      labelText: "Description",
                                      labelStyle: TextStyle(
                                        color: Colors.green,
                                        fontSize: 20,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 2, color: Colors.green)),
                                      border: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.green))),
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
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )),
                                  TextButton(
                                      onPressed: () {
                                        ls[i!]["title"] = ti.text;
                                        ls[i!]["description"] = ti2.text;
                                        mybox.put(1, ls);
                                        Navigator.pop(context);
                                      },
                                      child: Text("OK",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)))
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
              icon: Icon(
                Icons.edit,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {
                ls.removeAt(i!);
                mybox.put(1, ls);
                Navigator.pop(context);
              },
              icon: Icon(Icons.delete, color: Colors.white))
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 8,
              // child: Container(
              //     padding: EdgeInsets.all(5),
              //     child: Text(
              //       ls[i!]["description"].toString(),
              //       maxLines: 22,
              //       overflow: TextOverflow.ellipsis,
              //       style: TextStyle(
              //           fontWeight: FontWeight.w400,
              //           fontSize: 18,
              //           letterSpacing: 1,
              //           wordSpacing: 1),
              //     )),
              child: ListView(
                children: [
                  Text(
                    ls[i!]["description"].toString(),
                    // maxLines: 22,
                    // overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        letterSpacing: 1,
                        wordSpacing: 1),
                  )
                ],
              ),
            ),
            Divider(),
            Flexible(
                child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: 15, right: 15),
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "On: ",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade600),
                      ),
                      Text(ls[i!]["time"].toString(),
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Text(ls[i!]["date"].toString(),
                      style: TextStyle(fontWeight: FontWeight.bold))
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
