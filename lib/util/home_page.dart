import 'package:flutter/material.dart';
import 'todo_file.dart';

class HomePage extends StatefulWidget{
  const HomePage();

  @override
  State<HomePage> createState() =>_HomePageState();

}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xFFE3D2BF),
      appBar: AppBar(
title: Text("TO DO"),
        elevation: 0,
      ),
      body: ListView(
        children: [
          ToDoTile(taskName: "Make tutorial",
          taskComplated: false,
          onChanged: (p0){}),
          ToDoTile(taskName: "Make tutorial",
              taskComplated: false,
              onChanged: (p0){}),
        ],
      ),
    );
  }

}