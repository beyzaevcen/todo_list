import 'package:flutter/material.dart';
import 'home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {

  //initial the hive
  Hive.initFlutter();

  //open a box
  var box= Hive.box("mybox");
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
    debugShowCheckedModeBanner: false,
    home : HomePage(),


      theme: ThemeData(primarySwatch: Colors.orange),

    );
  }

}
