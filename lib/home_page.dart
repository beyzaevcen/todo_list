
import 'package:flutter/material.dart';
import 'package:to_do_new/dialog_box.dart';
import 'todo_file.dart';

class HomePage extends StatefulWidget{
  const HomePage();

  @override
  State<HomePage> createState() =>_HomePageState();

}

class _HomePageState extends State<HomePage> {
  //text contoller
  final _controller=TextEditingController();

  //Lİst of to do tasks
  List toDoList=[
    ["Love yourself more",false]
  ];
  //checkbox
  void checkBoxChanged(bool? value,int index){
    setState(() {
      toDoList[index][1]=!toDoList[index][1];
    });
  }
  //save task

  void saveNewTask(){
    setState(() {
      toDoList.add([_controller.text,false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }
  void createNewTask(){
    showDialog(
      context: context,
      builder: (context){
      return DialogBox(
        controller: _controller,
        onSave: saveNewTask,
        onCancel: ()=> Navigator.of(context).pop(),
      );
    },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xFFE3D2BF),
      appBar: AppBar(
title: Text("TO DO"),
        elevation: 0,
      ),
      floatingActionButton:FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add_sharp),
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
          itemBuilder: (context,index){
          return ToDoTile(
              taskName: toDoList[index][0],
              taskComplated: toDoList[index][1],
              onChanged: (value)=>checkBoxChanged(value,index),
          );
          }
      ),
    );
  }

}