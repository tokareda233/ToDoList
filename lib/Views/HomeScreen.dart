import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/Components/CustomButtomSheet.dart';
import 'package:to_do_app/Providers/TodoProvoder.dart';

class Homescreen extends StatelessWidget {
  Homescreen({super.key});
  TextEditingController addController = TextEditingController();
  TextEditingController UpdateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Todoprovoder providerObj = Provider.of<Todoprovoder>(
      context,
      listen: true,
    );
    return Scaffold(
      body: Container(
        color: Colors.teal,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              Row(
                children: [
                  Icon(Icons.checklist, color: Colors.white, size: 30),
                  SizedBox(width: 3),
                  Text(
                    "ToDayDo",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 6),
              Text(
                "${providerObj.counter} Tasks",
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 15),
              Container(
                width: 1600,
                height: 620,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Consumer<Todoprovoder>(
                  builder: (context, value, child){
                    if (value.todomodel == null) {
                      value.getTodoListProvider();
                      return Center(child: CircularProgressIndicator());
                    } else {
                      return ListView.builder(
                        itemCount: value.todomodel!.todoList.length,
                        itemBuilder: (context, index) => Card(
                          elevation: 3,
                          color: Colors.white,
                          child: ListTile(
                            title: Text(
                              value.todomodel!.todoList[index]["title"],
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  onPressed: () {

                                      showModalBottomSheet(
        context: context,
        builder:(context) =>  
         BottomSheet(onClosing: (){}, builder: (_){
            return Container(
              height: 200,
              width: 250,
              child: Column(
              children: [
                SizedBox(height: 10,),
                Text("Update Task",style: TextStyle(color: Colors.teal,fontWeight: FontWeight.bold,fontSize: 20),),
                TextField(
                  controller:UpdateController ,
                  decoration: InputDecoration(
                    label: Text("Update Task"),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)
                    )
                         
                  ),
                ),
                SizedBox(height: 15,),
                ElevatedButton(onPressed: (){
                  value.putTodoList(value.todomodel!.todoList[index], UpdateController.text);
                }, child: Text("Update",style: TextStyle(color: Colors.white),),style: ElevatedButton.styleFrom(backgroundColor: Colors.teal,))
              ],
                   ),
            );
           }),
       );
                                  },
                                  icon: Icon(
                                    Icons.edit,
                                    color: const Color.fromARGB(
                                      255,
                                      23,
                                      68,
                                      145,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 3),
                                IconButton(
                                  onPressed: () { },
                                  icon: Icon(Icons.delete, color: Colors.red),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
     
     floatingActionButton: FloatingActionButton(onPressed:() {
       showModalBottomSheet(
        context: context,
        builder:(context) =>  
         BottomSheet(onClosing: (){}, builder: (_){
            return Container(
              height: 200,
              width: 250,
              child: Column(
              children: [
                SizedBox(height: 10,),
                Text("Add Task",style: TextStyle(color: Colors.teal,fontWeight: FontWeight.bold,fontSize: 20),),
                TextField(
                  controller:addController ,
                  decoration: InputDecoration(
                    label: Text("Add Task"),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)
                    )
                         
                  ),
                ),
                SizedBox(height: 15,),
                ElevatedButton(onPressed: (){
                  providerObj.postTodoProvider(addController.text);
                }, child: Text("Add"),style: ElevatedButton.styleFrom(backgroundColor: Colors.teal,))
              ],
                   ),
            );
           }),
       );
       
     }
     ,child: Icon(Icons.add,color: Colors.white,),elevation: 3,backgroundColor: Colors.red,),

    );
  }
}
