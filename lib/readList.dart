import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class ListRead extends StatefulWidget {
  const ListRead({super.key});

  @override
  State<ListRead> createState() => _ListReadState();
}

class _ListReadState extends State<ListRead> {
  int? i;
  List ls= [];
  List li =[];
  List<bool> ll=[];
  Map mp={};
  var mybox=Hive.box('mybox');

  void getdata(){
    if(mybox.get(2)!=null){
      setState(() {
        ls=mybox.get(2);
      });
    try {
        setState(() {
          li=ls[i!]['description'];
          
        });
        for(int i=0;i<=li.length;i++){
          // mp[i]={li[i]:false};
            ll = List.generate(li.length, (index) => false);
        }
    } catch (e) {
      print(e);
    }
      // li=mp['descri']
      // print(li);
    }
  }

  Timer? _timer;

  void tmer(){
  _timer=Timer.periodic(Duration(seconds: 1), (timer) {
     setState(() {
      getdata();
    });
  },);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
    tmer();
  }
  @override
  Widget build(BuildContext context) {
    i=int.parse(ModalRoute.of(context)?.settings.arguments as String);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent.shade700,
        title: Text(ls[i!]['title'],style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22)),
        actions: [IconButton(onPressed: () {
          ls.removeAt(i!);
mybox.put(2, ls);
Navigator.pop(context);
        }, icon: Icon(Icons.delete,color: Colors.white,))],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              flex: 8,
              child: ListView.builder(
                itemCount: li.length,
                itemBuilder: (context, index) {
                  return ListTile(
              title: Text(li[index].toString(),),
              leading: Checkbox(
                activeColor: Colors.red,
                value: ll[index], 
                onChanged: (bool? value) {
               setState(() {
                ll[index]=value ?? true;
                     ll[index] ? Colors.green : Colors.white;
                    setState(() {
               li.removeAt(index);
                    });
                     ls[i!]['description']=li;
                     mybox.put(2, ls);
               });
               ScaffoldMessenger.of(context).showSnackBar(SnackBar( content: Text("Succesfully Removed")));
              },),
                  );
                
              },),
            ),
             Flexible(
                child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: 15, right: 15),
              height: 90,
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.baseline,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Text(
                    ls[i!]["time"].toString(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(ls[i!]["date"].toString(),
                      style: TextStyle(fontWeight: FontWeight.bold))
                ],
              ),
            ))
          ],
        ),
      ),
    
      
    );
  }
}
