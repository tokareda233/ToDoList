class Todomodel {

  List<dynamic> todoList;
  Todomodel({required this.todoList});
  
  factory Todomodel.fromJson(Map<String,dynamic> json){
    return Todomodel(todoList: json["todoList"]);
  }
}