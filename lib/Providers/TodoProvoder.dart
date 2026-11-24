import 'package:flutter/foundation.dart';
import 'package:to_do_app/Models/TodoModel.dart';
import 'package:to_do_app/Services/TodoServise.dart';

class Todoprovoder extends ChangeNotifier {
 int counter =0;
 Todomodel? todomodel;

 getTodoListProvider()async{
 todomodel=await Todoservise.GetTodoListService();
 counter=todomodel!.todoList.length;
  notifyListeners();
 }

postTodoProvider(String title)async{
  await Todoservise.postTodoListService( title);
  counter++;
 notifyListeners();
 getTodoListProvider();
}

 putTodoList(int id,String title)async{
 await Todoservise.putTodoListService(id, title);
 notifyListeners();
 getTodoListProvider();
 }


 deleteTodoList(int id)async{
 await Todoservise.deleteTodoListService(id);
 counter--;
 notifyListeners();
 }


}