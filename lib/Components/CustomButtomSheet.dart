import 'package:flutter/material.dart';

class Custombuttomsheet extends StatelessWidget {
  String Title;
  String eleText;
  VoidCallback onPressed;
  TextEditingController controller;

   Custombuttomsheet({super.key,required this.Title,required this.eleText,required this.onPressed,required this.controller});

  @override
  Widget build(BuildContext context) {
    return BottomSheet(onClosing: (){}, builder: (context) {
      return Column(
        children: [
          SizedBox(height: 10,),
          Text(Title,style: TextStyle(color: Colors.teal,fontWeight: FontWeight.bold,fontSize: 20),),
          TextField(
            controller: controller,
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
          ElevatedButton(onPressed: (){}, child: Text("Add"))
        ],
      );
    },);
  }
}
