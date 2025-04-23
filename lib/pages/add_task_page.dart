import 'package:flutter/material.dart';
import 'package:to_do_app/fonts.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back,
          color: Colors.pink,
        ),
        actions: const [
          CircleAvatar(
            backgroundImage: AssetImage("assets/images/person.jpeg"),
            radius: 25,
          ),
        SizedBox(
          width: 25,
        )
        ],
      ),

    body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             mainAxisAlignment: MainAxisAlignment.start, 
          children: [
            Center(
              child: Text(
                "Add Task",
                style: mainTitlestyle
                ),
            ),
            const SizedBox(
              height: 15,
            ),
             Column(
             crossAxisAlignment: CrossAxisAlignment.start,   
             children: [
              Text(
                "Title",
                style: inputFieldTitle.copyWith(fontSize: 19,fontWeight: FontWeight.bold),
              ),
             Container(
              margin: const EdgeInsets.only(left: 10,right: 10,top: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.grey
              )
              ),             
               child: Padding(
                 padding: const EdgeInsets.only(left: 15),
                 child: TextFormField(                  
                  decoration: const InputDecoration(
                    hintText: "Enter Title here",
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.pink
                      ),                   
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent
                      )
                    )
                  ),
                 ),
               ),
             )
             ], 
            )
            
          ],  
        ),
        )
      
      
      ) ,


    );
  }
}