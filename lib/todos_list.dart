import 'package:flutter/material.dart';

class TodosList extends StatefulWidget {
  final List<Map<String, dynamic>> tasks;
  const TodosList({super.key, required this.tasks});

  @override
  State<TodosList> createState() => __TodosListState();
}

class __TodosListState extends State<TodosList> {
  late List<Map<String, dynamic>> tasks;
  @override
  void initState() {
    super.initState();
    tasks = widget.tasks;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      //     child: ListView.builder(
      //   itemCount: null == tasks.length ? 0 : tasks.length,
      //   itemBuilder: (context, index) {
      //     return Container(
      //       height: 65,
      //       decoration: BoxDecoration(
      //         color: Color.fromARGB(145, 229, 231, 233),
      //         borderRadius: BorderRadius.circular(
      //             20), // Change the border radius here
      //       ),
      //       margin:
      //           EdgeInsets.only(left: 15, right: 15, bottom: 5, top: 10),
      //       child: Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: [
      //             // Text(tasks[index].toString()),
      //             // CustomCheckBoxState(
      //             //   title: tasks[index]["title"],
      //             //   isChecked: tasks[index]["isChecked"],
      //             // ),
      //             Wrap(
      //               crossAxisAlignment: WrapCrossAlignment.center,
      //               children: [
      //                 Checkbox(
      //                   value: tasks[index]["isChecked"] ,
      //                   activeColor: Colors.green,
      //                   onChanged: (bool? value) {},
      //                 )
      //               ],
      //             ),
      //             // CustomCheckBoxState(title:"hhhh",ischecked:tasks[index][1]),
      //             IconButton(
      //               onPressed: () {},
      //               icon: Icon(
      //                 Icons.delete_forever_outlined,
      //                 color: Colors.red,
      //               ),
      //             )
      //           ]),
      //     );
      //   },
      // ))
      child: ListView.builder(
        // reverse: true,
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          if (index < tasks.length) {
            return Dismissible(
              key: Key(tasks[index]["id"].toString()),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                // print(index);
                // tasks.removeAt(index);
                tasks.removeWhere((task) => task["id"] == tasks[index]["id"]);
                print(tasks);

//               tasks.removeWhere((task) {
//                 print(task["title"]==Key);
//                 print(task["title"]);
//                 print(Key);
// return task["title"]==Key;
//               } );
              },
              background: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(145, 229, 231, 233),
                  borderRadius: BorderRadius.circular(
                      15), // Change the border radius here
                ),
                margin: const EdgeInsets.only(
                    left: 15, right: 15, bottom: 5, top: 5),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "The task is deleted",
                      style: TextStyle(fontSize: 20),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Icon(
                          Icons.delete_forever_outlined,
                          color: Colors.red,
                          size: 25,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    tasks[index]["isChecked"] = !tasks[index]["isChecked"];
                  });
                },
                child: Container(
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(145, 229, 231, 233),
                    borderRadius: BorderRadius.circular(
                        15), // Change the border radius here
                  ),
                  margin: const EdgeInsets.only(
                      left: 15, right: 15, bottom: 5, top: 5),
                  child: ListTile(
                    leading: Checkbox(
                      shape: const CircleBorder(),
                      side: BorderSide(color: tasks[index]["color"], width: 2),
                      value: tasks[index]["isChecked"],
                      activeColor: tasks[index]["color"],
                      onChanged: (bool? value) {
                        setState(() {
                          tasks[index]["isChecked"] = value!;
                          // print(tasks[index].toString());
                        });
                      },
                    ),
                    title: Text(
                      ' ${tasks[index]["title"]}',
                      style: TextStyle(
                          color: Colors.black,
                          decoration: tasks[index]["isChecked"]
                              ? TextDecoration.lineThrough
                              : TextDecoration.none),
                    ),
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
