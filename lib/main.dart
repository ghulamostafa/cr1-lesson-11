import 'package:cr1_lesson_11/todo_widget.dart';
import 'package:flutter/material.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  TextEditingController _textController = TextEditingController();

  List<TodoItem> _items = [
    TodoItem(id: 1, text: 'First item', completed: true),
    TodoItem(id: 2, text: 'Second item', completed: false),
  ];

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: SizedBox(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ListView.builder(
                shrinkWrap: true,
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  return TodoWidget(
                    id: _items[index].id,
                    text: _items[index].text,
                    completed: _items[index].completed,
                    onComplete: () {
                      setState(() {
                        _items[index].completed = !_items[index].completed;
                      });
                    },
                  );
                },
              ),
              TextField(
                controller: _textController,
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    _items.add(
                      TodoItem(
                        id: _items.length + 1,
                        text: _textController.text,
                        completed: false,
                      ),
                    );
                  });
                  _textController.text = '';
                },
                child: Text(
                  'Add Item',
                  style: TextStyle(fontSize: 30),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class TodoItem {
  int id;
  String text;
  bool completed;

  TodoItem({required this.completed, required this.id, required this.text});
}
