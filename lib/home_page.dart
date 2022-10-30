import 'package:flutter/material.dart';
import '../util/todo_file.dart';

class HomePage extends StatefulWidget{
  const HomePage();

  @override
  State<HomePage> createState() =>_HomePageState();

}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xFF8CDC99),
      appBar: AppBar(
title: Text("TO DO"),
        elevation: 0,
      ),
      body: ListView(
        prototypeItem: ToDoTile(),
      ),
    );
  }

}