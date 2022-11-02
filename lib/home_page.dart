
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_new/database.dart';
import 'package:to_do_new/dialog_box.dart';
import 'todo_file.dart';

class HomePage extends StatefulWidget{
  const HomePage();

  @override
  State<HomePage> createState() =>_HomePageState();

}

class _HomePageState extends State<HomePage> {
  //reference hive box
  final _myBox=Hive.box('myBox');
  ToDoDataBase db=ToDoDataBase();

  void initState(){
    //first time opening app
    if(_myBox.get("TODOLIST")==null){
      db.createInitialData();
    }else{
      db.loadData();
    }

    super.initState();
  }


  //text contoller
  final _controller=TextEditingController();

  //Lİst of to do tasks

  //checkbox
  void checkBoxChanged(bool? value,int index){
    setState(() {
      db.toDoList[index][1]=!db.toDoList[index][1];
    });
    db.updateDataBase();
  }
  //save task

  void saveNewTask(){
    setState(() {
      db.toDoList.add([_controller.text,false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
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
    db.updateDataBase();
  }
  void deleteTask(int index){
setState(() {
  db.toDoList.removeAt(index);
}
);
db.updateDataBase();

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
        itemCount: db.toDoList.length,
          itemBuilder: (context,index){
          return ToDoTile(
            deleteFunction:(context)=> deleteTask(index),
              taskName: db.toDoList[index][0],
              taskComplated: db.toDoList[index][1],
              onChanged: (value)=>checkBoxChanged(value,index),
          );
          }
      ),
    );
  }

}