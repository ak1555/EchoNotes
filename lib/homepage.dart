import 'package:echonotes/List.dart';
import 'package:echonotes/Text.dart';
import 'package:echonotes/addList.dart';
import 'package:echonotes/Task.dart';
import 'package:echonotes/addTask.dart';
import 'package:echonotes/addText.dart';
import 'package:flutter/material.dart';

class Smple extends StatefulWidget {
  const Smple({super.key});

  @override
  State<Smple> createState() => _SmpleState();
}

class _SmpleState extends State<Smple> with TickerProviderStateMixin {
  late TabController _taccontroller;
  bool t = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _taccontroller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.greenAccent.shade700,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 48,
            ),
            Text(
              "   Echo Notes",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
            ),
            SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 50,
              child: TabBar(
                indicator: UnderlineTabIndicator(
                    insets: EdgeInsets.only(left: 33, right: 33),
                    borderSide: BorderSide(color: Colors.white, width: 3.5),
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(150))),
                controller: _taccontroller,
                labelColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.tab,
                labelStyle:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
              child: TabBarView(
                  controller: _taccontroller,
                  children: [HIpage(), Heypage(), Ooipage()]),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      floatingActionButton: t
          ? Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton.small(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => TextTasks(),
                    ));
                  },
                  backgroundColor: Colors.greenAccent.shade700,
                  child: Icon(
                      Icons.task_alt_outlined
                      ),
                ),
                FloatingActionButton.small(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ListTask(),
                    ));
                  },
                  backgroundColor: Colors.greenAccent.shade700,
                  child: Icon(
                    Icons.check_box, color: Colors.black,
                  ),
                ),
                FloatingActionButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => TaskTask(),
                    ));
                  },
                  backgroundColor: Colors.greenAccent.shade700,
                  child: Icon(
                    Icons.notes,
                    color: Colors.black,
                  ),
                ),
              ],
            )
          : FloatingActionButton(
              backgroundColor: Colors.greenAccent.shade700,
              onPressed: () {
                setState(() {
                  t = true;
                });
              },
              child: Icon(
                Icons.add,
                size: 35,
              ),
            ),
    );
  }
}
