import 'dart:async';

import 'package:flutter/material.dart';

class ListTask extends StatefulWidget {
  const ListTask({super.key});

  @override
  State<ListTask> createState() => _ListTaskState();
}

class _ListTaskState extends State<ListTask> {
  TextEditingController _controller = TextEditingController();
  List ls = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          "Add New Task",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              letterSpacing: 1),
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.check))],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Container(
              height: 80,
              child: Expanded(
                  flex: 1,
                  child: TextField(
                    cursorColor: Colors.green,
                    decoration: InputDecoration(
                        labelText: "Title",
                        labelStyle:
                            TextStyle(color: Colors.green, fontSize: 20),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Colors.green)),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                  )),
            ),
            Container(
              height: 80,
              // color: Colors.pink,
              child: Expanded(
                  child: TextField(
                controller: _controller,
                // maxLines: 30,
                cursorColor: Colors.green,
                decoration: InputDecoration(
                    alignLabelWithHint: true,
                    labelText: "Description",
                    labelStyle: TextStyle(
                      color: Colors.green,
                      fontSize: 20,
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: Colors.green)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green)),
                    suffixIcon: IconButton(
                        onPressed: () {
                          if (_controller.text != null) {
                            setState(() {
                              ls.add(_controller.text);
                              _controller.clear();
                            });
                          }
                        },
                        icon: Icon(
                          Icons.add,
                          color: Colors.green,
                          size: 30,
                        ))),
              )),
            ),
            Expanded(
                child: ListView.builder(
              itemCount: ls.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(ls[index].toString(),style: TextStyle(fontSize: 20),),
                  trailing:
                      IconButton(onPressed: () {
                        setState(() {
                          ls.removeAt(index);
                        });
                      }, icon: Icon(Icons.close)),
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
