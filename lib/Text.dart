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
      body: SizedBox(
          height: double.infinity,
          width: double.infinity,


          child: MasonryGridView.builder(
            itemCount: ls.length,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "readpage",arguments: index.toString());
                },
                child: Container(
                  padding: EdgeInsets.only(left: 8,top: 5,bottom: 5,right: 5),
                  decoration: BoxDecoration(
                     
                    //  color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                     color: Colors.red.shade300,
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Text(
                            ls[index]['title'].toString(),
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 19,
                                letterSpacing: 1),
                          ),

                        ],
                      ),
                      SizedBox(height: 10,),
                      Text(ls[index]['description'].toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                              letterSpacing: 0))
                    ],
                  ),
                ),
              );
            },
          )),
    );
  }
}
