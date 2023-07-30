class ToDo {
  String? id;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<ToDo> todoList() {
    return[
      ToDo(id: '01', todoText: "Morning Run", isDone: true),
      ToDo(id: '02', todoText: "Go to the store", isDone: true),
      ToDo(id: '03', todoText: "Finish homework", ),
      ToDo(id: '04', todoText: "Code my next app", ),
      ToDo(id: '05', todoText: "Pick up my brother", ),
      ToDo(id: '06', todoText: "Dinner with Elon Musk", ),
    ];
  }
}