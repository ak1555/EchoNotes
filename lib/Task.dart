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
  @override
  void initfun() {
    if (mybox.get(3) != null) {
      setState(() {
        ls = mybox.get(3);
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
        width:double.infinity,
          child: MasonryGridView.builder(
            itemCount: ls.length,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                                    Navigator.pushNamed(context, "task", arguments: index.toString());

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
                          // SizedBox(
                          //   width: 1,
                          // ),
                          Text(
                            ls[index]['title'].toString(),
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                letterSpacing: 1),
                          ),
                          // IconButton(
                          //   padding: EdgeInsets.all(0),
                          //   onPressed: () {},
                          //   icon: Icon(Icons.more_vert),
                          // )
                        ],
                      ),
                      SizedBox(height: 10,),
                      Text(ls[index]['description'].toString()
                      ,maxLines: 10,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                              letterSpacing: 0))
                    ],
                  ),
                ),
              );
            },
          )
      )
      // Center(child: Text("task"),),
    );
  }
}