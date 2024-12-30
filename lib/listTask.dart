// import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class ListTask extends StatefulWidget {
  const ListTask({super.key});

  @override
  State<ListTask> createState() => _ListTaskState();
}

class _ListTaskState extends State<ListTask> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController title = TextEditingController();
  var mybox = Hive.box('mybox');
  List ls = [];
  List li = [];
Map mp={};
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

        actions: [IconButton(onPressed: () {
    if(mybox.get(2)==null){
            mp={"title":title.text,"description":li};
          ls.add(mp);
          mybox.put(2, ls);
          }else{
            ls=mybox.get(2);
            mp={"title":title.text,"description":li};
          ls.add(mp);
          mybox.put(2, ls);
          }
          title.clear();

          print(li);
        }, icon: Icon(Icons.check,color: Colors.white,))],
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
            SizedBox(
              height: 80,
              child: Expanded(
                  flex: 1,
                  child: TextField(
                    controller: title,
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
            SizedBox(
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
                          setState(() {
                            li.add(_controller.text);
                            _controller.clear();
                          });
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
              itemCount: li.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(li[index].toString(),style: TextStyle(fontSize: 20),),
                  trailing:
                      IconButton(onPressed: () {
                        setState(() {
                          li.removeAt(index);
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
