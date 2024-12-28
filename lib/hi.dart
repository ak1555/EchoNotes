import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

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

  void initState() {
    // TODO: implement initState
    super.initState();
    initfun();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        // child: GridView.builder(
        //   itemCount: ls.length,
        //   gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: BouncingScrollSimulation.maxSpringTransferVelocity),
        //   gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent:2),
        //  itemBuilder: (context, index) {
        //   return Text(ls[index].toString());
        // },),
        child: GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, index) {
            return Text(ls[index]);
          },
        ),
      ),
    );
  }
}
