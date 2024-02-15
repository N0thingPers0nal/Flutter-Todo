// ignore_for_file: file_names

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:todo/datas.dart';

class CreateTodo extends StatefulWidget {
  final Function(Map<String, dynamic> newTask) updateTask;
  const CreateTodo({super.key, required this.updateTask});

  @override
  State<CreateTodo> createState() => _CreateTodoState();
}

class _CreateTodoState extends State<CreateTodo> {
  TextEditingController newTaskController = TextEditingController();
  // void _addTodo(Map<String, dynamic> newTask) {
  //   setState(() {
  //     allTasks.add(newTask);
  //     widget.updateTask(newTask);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          OutlinedButton(
            style: OutlinedButton.styleFrom(
                shape: const CircleBorder(),
                foregroundColor: Colors.black,
                elevation: 10),
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.close,
              size: 18,
            ),
          ),
        ],
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(60),
          child: Wrap(
            runSpacing: 50,
            alignment: WrapAlignment.center,
            children: <Widget>[
              TextField(
                controller: newTaskController,
                style: const TextStyle(fontSize: 30),
                cursorColor: Colors.blue,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.new_task_text_field,
                  border: InputBorder.none,
                ),
              ),
              Row(children: <Widget>[
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.only(
                            top: 15, bottom: 15, right: 20, left: 20),
                        alignment: Alignment.center),
                    onPressed: () {},
                    child: RichText(
                      text: TextSpan(
                        children: [
                          const WidgetSpan(
                            child: Icon(
                              Icons.calendar_today,
                              size: 22,
                              color: Color.fromARGB(107, 0, 0, 0),
                            ),
                          ),
                          TextSpan(
                              text: AppLocalizations.of(context)!.calender,
                              style: const TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(107, 0, 0, 0))),
                        ],
                      ),
                    )),
                SizedBox(
                  height: 100,
                  width: 100,
                  child: Center(
                    child: RadioListTile<int>(
                      activeColor: Colors.blue,
                      value: 1,
                      groupValue: 1,
                      onChanged: (value) {
                        setState(() {
                          // _selectedValue = value;
                        });
                      },
                    ),
                  ),
                ),
              ]),
              const SizedBox(
                width: 300,
                child: Wrap(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  alignment: WrapAlignment.center,
                  spacing: 45,
                  children: [
                    Icon(
                      Icons.create_new_folder_outlined,
                      size: 30,
                      color: Color.fromARGB(107, 0, 0, 0),
                    ),
                    Icon(
                      Icons.flag_outlined,
                      color: Color.fromARGB(107, 0, 0, 0),
                      size: 30,
                    ),
                    RotationTransition(
                      turns: AlwaysStoppedAnimation(0.9),
                      child: Icon(
                        Icons.nightlight_outlined,
                        color: Color.fromARGB(107, 0, 0, 0),
                        size: 30,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: SizedBox(
          width: 150,
          child: FloatingActionButton(
              backgroundColor: Colors.blue.shade700,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              onPressed: () {
                if (newTaskController.text.isNotEmpty) {
                  Map<String, dynamic> newTask = {
                    "id": allTasks.isNotEmpty ? allTasks.last["id"] + 1 : 0,
                    "title": newTaskController.text,
                    "isChecked": false,
                    "color": Colors.black,
                  };
                  // print(newTask);
                  // print(allTasks);
                  widget.updateTask(newTask);

                  newTaskController.clear();

                  Navigator.pop(context);
                } 
                else { var emptyField=SnackBar(content: Text(AppLocalizations.of(context)!.emptyField));ScaffoldMessenger.of(context).showSnackBar(emptyField);}
              },
              child: Wrap(
                spacing: 3,
                children: [
                  Text(
                    AppLocalizations.of(context)!.create,
                    style: const TextStyle(
                        fontSize: 19,
                        wordSpacing: 2,
                        fontWeight: FontWeight.w400),
                  ),
                  const RotationTransition(
                      alignment: Alignment.bottomCenter,
                      turns: AlwaysStoppedAnimation(0.25),
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        size: 15,
                      ))
                ],
              ))),
    );
  }
}
