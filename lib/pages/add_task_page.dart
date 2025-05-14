import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/fonts.dart';
import 'package:to_do_app/widgets/inputField.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  int selectedColor = 0;
  var selectedDate = DateTime.now();
  var startTIme = DateFormat('hh:mm a').format(DateTime.now());
  var endTIme = DateFormat('hh:mm a')
      .format(DateTime.now().add(const Duration(minutes: 15)));
  var selectedRemind = 5;
  var remindList = [5, 10, 15, 20];
  var selectedRepeat = 'None';
  var repeatList = ['None', 'Daily', 'Weekly', 'Monthly'];

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
                    InputField(
                      label: "Date",
                      hintText: DateFormat.yMMMd().format(selectedDate),
                      icon: IconButton(
                        onPressed: () => getDateFromUser(),
                        icon: const Icon(Icons.calendar_today_outlined),
                        color: Colors.grey,
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: InputField(
                            label: "Start Time",
                            hintText: startTIme,
                            icon: IconButton(
                              onPressed: () =>
                                  _getTimeFromUser(isStartTime: true),
                              icon: const Icon(Icons.access_time_rounded),
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InputField(
                            label: "End Time",
                            hintText: endTIme,
                            icon: IconButton(
                              onPressed: () =>
                                  _getTimeFromUser(isStartTime: false),
                              icon: const Icon(Icons.access_time_rounded),
                              color: Colors.grey,
                            ),
                          ),
                        )
                      ],
                    ),
                    InputField(
                      label: "Remind",
                      hintText: '$selectedRemind minutes early',
                      icon: Row(
                        children: [
                          DropdownButton(
                            borderRadius: BorderRadius.circular(10),
                            dropdownColor: Colors.pink,
                            items: remindList
                                .map(
                                  (value) => DropdownMenuItem(
                                    value: value,
                                    child: Text(
                                      '$value',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                            icon: const Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.grey,
                            ),
                            iconSize: 32,
                            elevation: 4,
                            underline: Container(
                              height: 0,
                            ),
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                            onChanged: (newValue) {
                              setState(() {
                                selectedRemind = newValue as int;
                              });
                            },
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                        ],
                      ),
                    ),
                    InputField(
                      label: "Repeat",
                      hintText: selectedRepeat,
                       icon :Row(
                    children: [
                      DropdownButton(
                        borderRadius: BorderRadius.circular(10),
                        dropdownColor: Colors.pink,
                        items: repeatList
                            .map(
                              (value) => DropdownMenuItem(
                                value: value,
                                child: Text(
                                  value,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                        icon: const Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.grey,
                        ),
                        iconSize: 32,
                        elevation: 4,
                        underline: Container(
                          height: 0,
                        ),
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                        onChanged: (newValue) {
                          setState(() {
                            selectedRepeat = newValue as String;
                          });
                        },
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                    ],
                  ),

                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: List.generate(
                            3,
                            (index) => GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedColor = index;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 7),
                                child: CircleAvatar(
                                  radius: 16,
                                  backgroundColor: index == 0
                                      ? Colors.pink
                                      : index == 1
                                          ? Colors.orange
                                          : Colors.amber,
                                  child: selectedColor == index
                                      ? const Icon(
                                          Icons.done,
                                          color: Colors.white,
                                          weight: 14,
                                          size: 16,
                                        )
                                      : null,
                                ),
                              ),
                            ),
                          ),
                        ),
                        FilledButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              elevation: const WidgetStatePropertyAll(14),
                              shadowColor: const WidgetStatePropertyAll(
                                  Color.fromARGB(197, 0, 0, 0)),
                              backgroundColor:
                                  const WidgetStatePropertyAll(Colors.pink),
                              shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(12)))),
                          child: const Text(
                            "Create Task",
                          ),
                        ),
                      ],
                    )
                  ]),
            ),
          ),
        ));
  }

  getDateFromUser() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      firstDate: DateTime(2024),
      lastDate: DateTime(2030),
      initialDate: selectedDate,
    );
    setState(() {
      selectedDate = pickedDate!;
    });
  }

  _getTimeFromUser({required bool isStartTime}) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: isStartTime
          ? TimeOfDay.fromDateTime(DateTime.now())
          : TimeOfDay.fromDateTime(
              DateTime.now().add(const Duration(minutes: 15))),
    );

    String formattedTime = pickedTime!.format(context);

    if (isStartTime) {
      setState(() {
        startTIme = formattedTime;
      });
    }

    if (!isStartTime) {
      setState(() {
        endTIme = formattedTime;
      });
    }
  }
}
