import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:todo_app/myDrawer.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(
        title: 'Flutter Demo Home Page',
        items: [
          {'id': 1, 'task': "S1", 'category': 'misc', 'isDone': false}
        ],
        category: "misc",
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage(
      {super.key,
      required this.title,
      required this.items,
      required this.category});
  final String title;
  final String category;
  final List<Map<String, dynamic>> items;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var isInputSectionVisible = false;
  String taskInput = '';
  var selectedTasks = [];
  var quote = [];

  fetchQuote() async {
    final response =
        await http.get(Uri.parse('https://api.quotable.io/quotes/random'));
    setState(() {
      quote = json.decode(response.body);
    });
  }

  @override
  void initState() {
    super.initState();
    fetchQuote();
  }

  @override
  Widget build(BuildContext context) {
    var pendingTasks =
        widget.items.where((item) => item['isDone'] == false).toList();
    var items = widget.items;

    return Scaffold(
      drawer: myDrawer(),
      appBar: AppBar(
        title: Text(
          "My ToDO App",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        elevation: 5,
        backgroundColor: Colors.blueGrey,
        actions: [Padding(padding: const EdgeInsets.symmetric(horizontal: 20))],
      ),
      body: !isInputSectionVisible
          ? SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (quote.length != 0)
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        quote[0]['content'],
                        style: TextStyle(
                            fontSize: 18,
                            fontStyle: FontStyle.italic,
                            color: Colors.blueGrey),
                      ),
                    ),
                 Container(
  margin: EdgeInsets.all(20),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    gradient: LinearGradient(
      colors: [Colors.blue, Colors.blue[400]!],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.blueGrey.withOpacity(0.5),
        spreadRadius: 1,
        blurRadius: 7,
        offset: Offset(0, 3),
      ),
    ],
  ),
  child: ListTile(
    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
    leading: Icon(
      Icons.access_time_rounded,
      color: Colors.white,
      size: 30,
    ),
    title: Text(
      "Manage Your time well",
      style: TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
)
,
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      "You Have ${pendingTasks.length} tasks for today",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      "Category: " + widget.category,
                      style: TextStyle(fontSize: 16, color: Colors.blueGrey),
                    ),
                  ),
                  SizedBox(height: 20),
                  if (selectedTasks.length != 0)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Center(
                        child: ElevatedButton(
                          style:
                              ElevatedButton.styleFrom(primary: Colors.redAccent),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.delete_forever),
                              SizedBox(width: 8.0),
                              Text('Delete Selected Tasks'),
                            ],
                          ),
                          onPressed: () {
                            setState(() {
                              items.removeWhere(
                                  (task) => selectedTasks.contains(task['id']));
                              selectedTasks.clear();
                            });
                          },
                        ),
                      ),
                    ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: items.length,
                    itemBuilder: (BuildContext context, int index) {
                      bool isSelected =
                          selectedTasks.contains(items[index]['id']);
                      return Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 4.0),
                        decoration: BoxDecoration(
                          color:
                              isSelected ? Colors.blueGrey[100] : Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 16.0),
                          onTap: () {
                            setState(() {
                              items[index]['isDone'] = !items[index]['isDone'];
                            });
                          },
                          onLongPress: () {
                            setState(() {
                              if (isSelected) {
                                selectedTasks.remove(items[index]['id']);
                              } else {
                                selectedTasks.add(items[index]['id']);
                              }
                            });
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          tileColor: items[index]['isDone']
                              ? Colors.grey[200]
                              : Colors.white,
                          leading: items[index]['isDone']
                              ? Icon(Icons.check_box, color: Colors.blueGrey)
                              : Icon(Icons.check_box_outline_blank,
                                  color: Colors.blueGrey),
                          trailing: Text(
                            "9:20",
                            style: TextStyle(
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.bold),
                          ),
                          title: Text(
                            items[index]['task'],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.blueGrey,
                              decoration: items[index]['isDone']
                                  ? TextDecoration.lineThrough
                                  : null,
                            ),
                          ),
                        ),
                      );
                    },
                  )
                ],
              ),
            )
          : Container(
              margin: EdgeInsets.symmetric(vertical: 100, horizontal: 50),
              child: Column(
                children: [
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        taskInput = value;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Task',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Category: " + widget.category,
                    style: TextStyle(fontSize: 18, color: Colors.blueGrey),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        widget.items.add({
                          'id': 10,
                          'isDone': false,
                          'task': taskInput,
                          'category': widget.category
                        });
                        isInputSectionVisible = !isInputSectionVisible;
                      });
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.blueGrey)),
                    child: Text('Submit'),
                  ),
                ],
              ),
            ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey[200],
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.blueGrey)),
            child: Text("Add New Task"),
            onPressed: () {
              setState(() {
                isInputSectionVisible = !isInputSectionVisible;
              });
            },
          ),
        ),
      ),
    );
  }
}
