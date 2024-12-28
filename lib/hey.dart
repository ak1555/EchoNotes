import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Heypage extends StatefulWidget {
  const Heypage({super.key});

  @override
  State<Heypage> createState() => _HeypageState();
}

class _HeypageState extends State<Heypage> {
  var mybox = Hive.box('mybox');

  List ls=[];
  void swtdata(){
    setState(() {
      if(mybox.get(2)!=null){
        ls=mybox.get(2);
      }
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    swtdata();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        height: double.infinity,
        width: double.infinity,
        child: GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, index) {
            return Text(ls[index]);
          },
        ),
      )
      //  Center(child: Text("list"),),
    );
  }
}