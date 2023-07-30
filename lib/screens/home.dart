import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../widgets/todo_item.dart';
import '../model/todo.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final listtodo = ToDo.todoList();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: buildAppBar(),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 15,
              ),
            child: Column(
              children: [
                searchBox(),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: 50,
                          bottom: 20,
                        ),
                        child: Text(
                          "Todo List:",
                          style: TextStyle(
                          fontSize: 30, 
                          fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      for ( ToDo todoo in listtodo )
                        TodoItem(
                          todo: todoo,
                          onToDoChanged: handleToDoChange,
                          onDeleteItem: () {},
                        ),
                    ],
                  ),
                )

              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(children: [
              Expanded(child: Container(
                margin: EdgeInsets.only(
                  bottom: 20, 
                  right: 20, 
                  left: 20,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20, 
                    vertical: 5,
                    ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [BoxShadow(
                      color: Colors.grey, 
                      offset: Offset(0.0, 0.0),
                      blurRadius: 10.0,
                      spreadRadius: 0.0, 
                      ),],
                      borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Add a new topic",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  bottom: 20,
                  right: 20,
                ),
                child: ElevatedButton(
                  child: Text("+",style: TextStyle(fontSize: 40,),),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: blue,
                    minimumSize: Size(60, 60),
                    elevation: 10,
                  ),
                ),
              )
            ]),
          )
        ],
      ), 
    );
  }

// the functionality of the app
void handleToDoChange (ToDo todo){
  setState(() {
    todo.isDone = !todo.isDone; // If true, set to false. If false, set to true  
  });
}

Widget searchBox(){
  return Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20)
              ),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(0),
                  prefixIcon: Icon(Icons.search, 
                  color: black, 
                  size: 20,
                  ),
                  prefixIconConstraints: BoxConstraints(
                    maxHeight: 20, 
                    minWidth: 25,
                    ),
                    border: InputBorder.none,
                    hintText: "Search"
                ),
              ),
            );
}

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Icon(Icons.menu, 
        color: black, 
        size: 30
        ),

      Container(
        height: 40,
        width: 40,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset('assets/images/avatar.jpg'),
        ),
      ),
    ]),
  );
  }
}