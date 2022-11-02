import 'package:hive_flutter/hive_flutter.dart';
class ToDoDataBase{

List toDoList=[];

  //reference our box

  final _myBox=Hive.box('myBox');
//run this method if this is the first time ever opening app
  void createInitialData(){
    toDoList=[
      ["Love yourself more",false],
    ];
}
//load the data from database
void loadData(){
    toDoList =_myBox.get("TODOLIST");
}

void updateDataBase(){
_myBox.put("TODOLIST",toDoList);
}
}