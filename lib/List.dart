// import 'dart:math';

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hive/hive.dart';

class Heypage extends StatefulWidget {
  const Heypage({super.key});

  @override
  State<Heypage> createState() => _HeypageState();
}

class _HeypageState extends State<Heypage> {
  var mybox = Hive.box('mybox');

  List ls = [];
  List li = [];

  void swtdata() {
    setState(() {
      if (mybox.get(2) != null) {
        setState(() {
          ls = mybox.get(2);
        });
      }
    });
  }

  Timer? _timer;

  void tmer() {
    _timer = Timer.periodic(
      Duration(seconds: 1),
      (timer) {
        swtdata();
      },
    );
    // Timer.run(() =>swtdata);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    swtdata();
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
                li = ls[index]['description'];

                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "list",
                        arguments: index.toString());
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.red.shade300,
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              ls[index]['title'].toString(),
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  letterSpacing: 1),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 100,
                          child: Expanded(
                              child: ListView.builder(
                            itemCount: li.length,
                            itemBuilder: (context, index) {
                              return Text(li[index].toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 17,
                                      letterSpacing: 1));
                            },
                          )),
                        )
                      ],
                    ),
                  ),
                );
              },
            ))
        );
  }
}
