import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class TaskRead extends StatefulWidget {
  const TaskRead({super.key});

  @override
  State<TaskRead> createState() => _TaskReadState();
}

class _TaskReadState extends State<TaskRead> {
  int? i;
  List ls = [];

  var mybox = Hive.box('mybox');
  void getdata() {
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
        // if(Duration()==Duration(seconds: 5).inSeconds   ){

        // }
        setState(() {
          getdata();
        });
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
  Widget build(BuildContext context) {
    i = int.parse(ModalRoute.of(context)?.settings.arguments as String);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent.shade700,
        title: Center(
          child: Text(
            ls[i!]["title"].toString(),
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                letterSpacing: 1),
          ),
        ),
        actions: [
           IconButton(
              onPressed: () {
                TextEditingController ti = TextEditingController();
                    TextEditingController ti2 = TextEditingController();
                    setState(() {
                      ti.text=ls[i!]["title"];
                    ti2.text=ls[i!]["description"];
                    });

                showDialog(
                  context: context,
                  builder: (context) {
                     return  Scaffold(
                      appBar: AppBar(
                        title: Text("Edit",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),
                        backgroundColor: Colors.greenAccent.shade700,
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
                                            color: Colors.green, fontSize: 20),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 2, color: Colors.green)),
                                        border: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.green))),
                                  )),
                                  SizedBox(height: 15,),
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
                                
                        TextButton(onPressed: () {
                          Navigator.pop(context);
                        }, child: Text("CANCEL",style: TextStyle(fontWeight: FontWeight.bold),)),
                                TextButton(onPressed: () {
                          ls[i!]["title"]=ti.text;
                          ls[i!]["description"]=ti2.text;
                          mybox.put(3, ls);
                          Navigator.pop(context);
                        }, child: Text("OK",style: TextStyle(fontWeight: FontWeight.bold) ))
                      
             
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
              icon: Icon(Icons.edit,color: Colors.white,),
              ),
          IconButton(
              onPressed: () {
                ls.removeAt(i!);
                mybox.put(3, ls);
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.delete,
                color: Colors.white,
              ))
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // SizedBox(height: 15,),
            Expanded(
              flex: 8,
              child: Container(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    ls[i!]["description"].toString(),
                    maxLines: 15,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        letterSpacing: 1,
                        wordSpacing: 1),
                  )),
            ),
            Flexible(
                child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: 15, right: 15),
              height: 90,
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.baseline,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Text(
                    ls[i!]["time"].toString(),
                    style: TextStyle(fontWeight: FontWeight.bold),
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
