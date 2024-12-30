// import 'package:echonote/hey.dart';
// import 'package:echonote/hi.dart';
// import 'package:echonote/listTask.dart';
// import 'package:echonote/ooi.dart';
// import 'package:echonote/taskTask.dart';
// import 'package:echonote/textTask.dart';
import 'package:echonotes/hey.dart';
import 'package:echonotes/hi.dart';
import 'package:echonotes/listTask.dart';
import 'package:echonotes/ooi.dart';
import 'package:echonotes/taskTask.dart';
import 'package:echonotes/textTask.dart';
import 'package:flutter/material.dart';

class Smple extends StatefulWidget {
  const Smple({super.key});

  @override
  State<Smple> createState() => _SmpleState();
}

class _SmpleState extends State<Smple> with TickerProviderStateMixin {
  late TabController _taccontroller;
  bool t=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _taccontroller=TabController(length: 3, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          // padding: const EdgeInsets.all(8.0),
          color: Colors.green.shade600,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 32,
              ),
              Text(
                "   Echo Notes",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 23),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 50,
                child: TabBar(
                  indicator: BoxDecoration(

                      // color: Colors.white,

                      // borderRadius: BorderRadius.circular(20),
                      ),
                      controller: _taccontroller,
                  labelColor: Colors.white,
                  indicatorColor: Colors.white,
                  labelStyle:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  dividerColor: Colors.black,
                  tabs: [
                    Tab(
                      text: "Text",
                    ),
                    Tab(
                      text: "List",
                    ),
                    Tab(
                      text: "Task",
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(controller: _taccontroller,
                  children: [ HIpage(), Heypage(), Ooipage() ]),
              )
            ],
          ),
        ),
                floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
        floatingActionButton:t? Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton.small(
              onPressed: () {
                 Navigator.of(context).push(MaterialPageRoute(builder: (context) => TextTasks(),));
              },
              backgroundColor: Colors.green.shade600,
              child: Icon(
                // Icons.note_alt_outlined,
                Icons.task_alt_outlined
                // size: 35,
              ),
            ),
             FloatingActionButton.small(
              onPressed: () {
               Navigator.of(context).push(MaterialPageRoute(builder: (context) => ListTask(),));
              },
              backgroundColor: Colors.green.shade600,
              child: Icon(
                Icons.check_box,color: Colors.black,
                // size: 35,
              ),
            ),
             FloatingActionButton(
              onPressed: () {
                 Navigator.of(context).push(MaterialPageRoute(builder: (context) => TaskTask(),));
              },
              backgroundColor: Colors.green.shade600,
              child: Icon(
                Icons.notes,
               color: Colors.black,
              ),
            ),
          ],
        ):FloatingActionButton(
          backgroundColor: Colors.green,
          onPressed: () {
          setState(() {
            t=true;
          });
        },child: Icon(Icons.add,size: 35,),),
    );
  }
}