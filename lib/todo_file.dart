import 'package:flutter/material.dart';

class ToDoTile extends StatelessWidget {




  final String taskName;
  final bool taskComplated;
  Function(bool?)? onChanged;


  ToDoTile({
    required this.taskName,
    required this.taskComplated,
    @required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(

        padding:const EdgeInsets.only(left: 25.0,right: 25.0,top: 25.0),

        child: Container(
          padding: EdgeInsets.all(24.0),
          child: Row(
            children: [

              Checkbox(value: taskComplated, onChanged: onChanged),
              Text(taskName),

              Checkbox(
                  value: taskComplated,
                  onChanged: onChanged,
                activeColor:Colors.black ,
              ),
              Text(
                  taskName,
                style: TextStyle(decoration: taskComplated? TextDecoration.lineThrough:TextDecoration.none),
              ),

            ],
          ),
    decoration: BoxDecoration(
        color: Colors.orange[300],
    borderRadius: BorderRadius.circular(20)),
    ),
    );


  }
}
