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
  List<ToDo> foundToDo = [];
  final todoController = TextEditingController();
  
  @override
  void initState(){
    foundToDo = listtodo;
    super.initState();
  }

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
                      // the .reversed reverses the list (new todos added on top)
                      for ( ToDo todoo in foundToDo.reversed)
                        TodoItem(
                          todo: todoo,
                          onToDoChanged: handleToDoChange,
                          onDeleteItem: deleteToDoItem,
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
                    controller: todoController,
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
                  onPressed: () {
                    addToDoItem(todoController.text);
                  },
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

// delete an item functionality
void deleteToDoItem(String id){
  setState(() {
    listtodo.removeWhere((item) => item.id == id);
  });
}

//add a new item functionality
void addToDoItem(String toDo){
  //set a unique ID (generated from the time we delete)
  setState(() {
    listtodo.add(ToDo(id: DateTime.now().millisecondsSinceEpoch.toString(), todoText: toDo,));
  });
  todoController.clear();
}

// search a todo functionality
void searchToDo(String enterdToDo){
  List<ToDo> results = [];
  // if someone puts in nothing in the search bar, display the available todo items
  if(enterdToDo.isEmpty){
    results = listtodo;
  } else {
    results = listtodo.where((item) => item.todoText!.toLowerCase().contains(enterdToDo.toLowerCase())).toList();
  }
  setState(() {
    foundToDo = results;
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
                onChanged: (value) => searchToDo(value) ,
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