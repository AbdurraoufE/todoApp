import 'package:flutter/material.dart';
import '../constants/colors.dart';

class TodoItem extends StatelessWidget{
  const TodoItem({Key ? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          print("Clicked a ToDo Item!");
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: Colors.white,
        leading: Icon(
          Icons.check_box, 
          color: blue,
          ),
        title: Text(
          "Do Java Homework", 
          style: TextStyle(
            fontSize: 16, 
            color: black, 
            decoration: TextDecoration.lineThrough,
          ),
        ),
        trailing: Container(
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.symmetric(vertical: 12 ),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: red,
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
            color: Colors.white,
            iconSize: 18,
            icon: Icon(Icons.delete),
            onPressed: () {
              print("Deleted a ToDo Item!");
            },
          ),
        ),
      ),
    );
  }
}