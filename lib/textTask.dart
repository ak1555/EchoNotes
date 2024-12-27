import 'package:flutter/material.dart';

class TextTasks extends StatefulWidget {
  const TextTasks({super.key});

  @override
  State<TextTasks> createState() => _TextTasksState();
}

class _TextTasksState extends State<TextTasks> {
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
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Container(
              height: 100,
              child: Expanded(
                  flex: 1,
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                  )),
            ),
            Expanded(
                child: TextField(
              // keyboardType: TextInputType.streetAddress,
              // maxLength: 15,
              maxLines: 20,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green))),
            ))
          ],
        ),
      ),
    );
  }
}
