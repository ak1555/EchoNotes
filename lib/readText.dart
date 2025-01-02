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
  // List li =[];
  // List<bool> ll=[];
  // Map mp={};
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
        // if(Duration()==Duration(seconds: 5).inSeconds   ){

        // }
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
        title: Text(ls[i!]["title"].toString(),
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 22)),
        actions: [
          // IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
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
              child: Container(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    ls[i!]["description"].toString(),
                    maxLines: 17,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        letterSpacing: 1,
                        wordSpacing: 1),
                  )),
            ),
            Divider(),
            Flexible(
                child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: 15, right: 15),
              height: 80,
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.baseline,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Text(ls[i!]["time"].toString(),
                      style: TextStyle(fontWeight: FontWeight.bold)),
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
