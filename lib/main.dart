// ignore_for_file: avoid_print

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todo/createTodo.dart';
import 'package:todo/custom.dart';
import 'package:todo/datas.dart';
import 'package:todo/todos_list.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});
  final List<String> _lang = ["en", "de"];
  String _currentLang = "en";

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void upadteLanguage(String lang) {
    setState(() {
      widget._currentLang = lang;
    });
  }

  @override
  Widget build(BuildContext context) {
    // print(widget._currentLang);
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      locale: Locale(widget._currentLang),
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      title: 'Todo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 204, 176, 215)),
        useMaterial3: true,
      ),
      home: SafeArea(
          child: MyHomePage(
        title: 'Todo',
        languages: widget._lang,
        currentLanguage: widget._currentLang,
        upadteLanguage: upadteLanguage,
      )),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    super.key,
    required String title,
    required this.languages,
    required this.currentLanguage,
    required this.upadteLanguage,
  });
  final List<String> languages;
  final Function(String lang) upadteLanguage;
  String currentLanguage;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Map<String, dynamic>> tasks = allTasks;
  void updateTask(Map<String, dynamic> newTask) {
    // print("From main");
    // print(newTask);
    // print(tasks);
    setState(() {
      tasks.insert(0,newTask);
    });
    // print(tasks);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // title: Text(widget.title),
        actions: <Widget>[
          DropdownButton(
            value: widget.currentLanguage,
            onChanged: (newValue) {
              widget.upadteLanguage(newValue!);
            },
            items: widget.languages.map((language) {
              return DropdownMenuItem(
                value: language,
                child: Text(language),
              );
            }).toList(),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.notifications_outlined))
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              decoration: const BoxDecoration(color: Colors.white),
              child: SizedBox(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 100,
                        height: 100,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            ClipOval(
                              child: Image.network(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgdZpEDslKnjBmPC6dlF6pf9Q2m1o5aMdHwg&usqp=CAU', // Replace with your image URL
                                width: 200,
                                height: 200,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              width: 250,
                              height: 250,
                              child: CircularProgressIndicator(
                                value:
                                    0.2, // Set the progress value here (0.0 to 1.0)
                                strokeWidth:
                                    4, // Adjust the thickness of the progress bar
                                backgroundColor: Colors.grey[200],
                                valueColor: const AlwaysStoppedAnimation<Color>(
                                    Colors.blue),
                              ),
                            ),
                          ],
                        ),
                      ),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: const CircleBorder(),
                          foregroundColor: Colors.black,
                          elevation: 10,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(Icons.close),
                      ),
                    ],
                  ),
                  const Text(
                    "Joy Mitchell",
                    style: TextStyle(fontSize: 30),
                  ),
                ],
              )),
            ),
            ListTile(
                leading: const Icon(Icons.bookmark_outline),
                title: Text(AppLocalizations.of(context)!.templete)),
            ListTile(
                leading: const Icon(Icons.category_outlined),
                title: Text(AppLocalizations.of(context)!.categories)),
            ListTile(
                leading: const Icon(Icons.analytics_outlined),
                title: Text(AppLocalizations.of(context)!.analytics)),
            ListTile(
                leading: const Icon(Icons.settings),
                title: Text(AppLocalizations.of(context)!.settings)),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)!.welcome_message("Joy"),
                  style: const TextStyle(
                      fontWeight: FontWeight.w900, fontSize: 30),
                ),
                // checking
                sizedHeightBox(),
                textDull(AppLocalizations.of(context)!.category_title),
                sizedHeightBox(),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Card(
                          elevation: 6,
                          child: SizedBox(
                              width: 200,
                              height: 100,
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text("10 tasks",
                                        style:
                                            TextStyle(color: Colors.black54)),
                                    const Text("Business",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                            fontSize: 20)),
                                    LinearProgressIndicator(
                                        value: 0.65,
                                        borderRadius: BorderRadius.circular(10),
                                        backgroundColor: const Color.fromARGB(
                                            255, 249, 246, 246),
                                        valueColor:
                                            const AlwaysStoppedAnimation<Color>(
                                                Color.fromARGB(
                                                    255, 235, 39, 160)))
                                  ],
                                ),
                              )),
                        ),
                        sizedWidthBox(),
                        Card(
                          elevation: 6,
                          child: SizedBox(
                              width: 200,
                              height: 100,
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text("15 tasks",
                                        style:
                                            TextStyle(color: Colors.black54)),
                                    const Text("Personal",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                            fontSize: 20)),
                                    LinearProgressIndicator(
                                        value: 0.55,
                                        borderRadius: BorderRadius.circular(10),
                                        backgroundColor: const Color.fromARGB(
                                            255, 249, 246, 246),
                                        valueColor:
                                            const AlwaysStoppedAnimation<Color>(
                                                Colors.blue))
                                  ],
                                ),
                              )),
                        ),
                        sizedWidthBox(),
                      ]),
                ),

                sizedHeightBox(),
                textDull(AppLocalizations.of(context)!.task_title),
                sizedHeightBox()
              ],
            ),
            TodosList(tasks: tasks),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => CreateTodo(updateTask: updateTask)));
        },
        tooltip: 'Add',
        shape: const CircleBorder(),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    );
  }
}
