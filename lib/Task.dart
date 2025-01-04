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
  List ll=[];
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
 void a(){
   ll = List.generate(ls.length, (index) => false);
   ChangeNotifier();
 }

  void initState() {
    // TODO: implement initState
    super.initState();
    initfun();
    tmer();
    a();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: double.infinity,
            width: double.infinity,
            child: MasonryGridView.builder(
              itemCount: ls.length,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, index) {
               
              return  GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "task",
                        arguments: index.toString());
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.red.shade300,
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
                                  ll[index]=!ll[index];
                                });
                              },
                              icon:ll[index]? Icon(Icons.keyboard_arrow_down_outlined):Icon(Icons.keyboard_arrow_up),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                   
                        // SizedBox(
                        //   height: 8,
                        // ),
                        Container(
                          padding: EdgeInsets.only(left: 5),
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                ls[index]["date"].toString(),
                                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),
                              ),
                              Text(ls[index]["time"].toString(),
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold,fontSize: 13)),
                            ],
                          ),
                        ),
                        SizedBox(height: 10,),
                           ll[index]?  Text(ls[index]['description'].toString(),
                            maxLines: 5,
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 17,
                                overflow: TextOverflow.ellipsis,
                                letterSpacing: 0)):SizedBox(height: 1,),
                                SizedBox(height: 10,),
                               ll[index]?  Text("Task ended",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold,fontSize: 13)):SizedBox(height: 1,),
                                SizedBox(height: ll[index]? 8:0,),
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
