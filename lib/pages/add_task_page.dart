import 'package:flutter/material.dart';
import 'package:to_do_app/fonts.dart';
import 'package:to_do_app/widgets/inputField.dart';

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
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Center(
                      child: Text("Add Task", style: mainTitlestyle),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const InputField(
                      label: "Title",
                      hintText: "Enter title here",
                    ),
                    const InputField(
                      label: "Note",
                      hintText: "Enter note here",
                    ),
                    const InputField(
                      label: "Date",
                      hintText: "",
                    ),
                    const Row(
                      children: [
                        Expanded(
                          child: InputField(
                            label: "Start Date",
                            hintText: "",
                          ),
                        ),
                        Expanded(
                          child: InputField(
                            label: "End Date",
                            hintText: "",
                          ),
                        ),
                      ],
                    ),
                    const InputField(
                      label: "Remind",
                      hintText: "",
                    ),
                    const InputField(
                      label: "Repeat",
                      hintText: "",
                    ),
                    Row(
                      children: [
                        Row(
                          children: List.generate(
                            3,
                            (index) => CircleAvatar(
                              backgroundColor: index == 0
                                  ? Colors.pink
                                  : index == 1
                                      ? Colors.orange
                                      : Colors.amber,
                            ),
                          ),
                        )
                      ],
                    )
                  ]),
            ),
          ),
        ));
  }
}
