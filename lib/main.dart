import 'package:flutter/material.dart';
import 'package:todo/models/item.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  var items = new List<Item>();

  HomePage() {
    items = [];
    items.add(Item(title: "titulo", done: false));
    items.add(Item(title: "titulo2", done: true));
  }

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var newTaskController = TextEditingController();

  void add() {
    if (newTaskController.text.isEmpty) return;

    setState(
      () {
        widget.items.add(
          Item(
            title: newTaskController.text,
            done: false,
          ),
        );
        newTaskController.text = "";
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          controller: newTaskController,
          keyboardType: TextInputType.text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
          decoration: InputDecoration(
            labelText: "Nova Tarefa",
            labelStyle: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: widget.items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = widget.items[index];
          return CheckboxListTile(
            title: Text(item.title),
            key: Key(index.toString()),
            value: item.done,
            onChanged: (value) {
              setState(() {
                item.done = value;
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: add,
        child: Icon(Icons.add),
        backgroundColor: Colors.pink,
      ),
    );
  }
}
