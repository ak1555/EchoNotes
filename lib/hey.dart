import 'package:flutter/material.dart';

class Heypage extends StatefulWidget {
  const Heypage({super.key});

  @override
  State<Heypage> createState() => _HeypageState();
}

class _HeypageState extends State<Heypage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("list"),),
    );
  }
}