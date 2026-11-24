import 'package:dio/dio.dart';
import 'package:to_do_app/Models/TodoModel.dart';

class Todoservise {

  static Dio dio=Dio();
  static Future<Todomodel> GetTodoListService()async{
  try{
   Response response =await dio.get("https://mytodoapi.runasp.net/api/TodoItems/");
     return Todomodel.fromJson(response.data);

  }catch(e){
    throw Exception(e);
  }
  }

  static Future<void> postTodoListService(String title)async{
  try{

   Response response =await dio.post("https://mytodoapi.runasp.net/api/TodoItems/",
   data: {
     "title":title,
     "isCompleted":false,
     "createdAt":"2026-11-24T09:19:49.8455995"

   });
     
  }catch(e){
    throw Exception(e);
  }
  }

   static Future<void> putTodoListService(int id,String title)async{
  try{

   Response response =await dio.put("https://mytodoapi.runasp.net/api/TodoItems/$id",
   data: {
     "title":title
   });
     
  }catch(e){
    throw Exception(e);
  }
  }

static Future<void> deleteTodoListService(int id)async{
  try{

   Response response =await dio.delete("https://mytodoapi.runasp.net/api/TodoItems/$id");
  
     
  }catch(e){
    throw Exception(e);
  }
  }

}