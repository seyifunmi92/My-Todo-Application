import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
        accentColor: Colors.white,
        brightness: Brightness.light,
      ),
      home: MyTodo(),
    ));

class MyTodo extends StatefulWidget {
  @override
  _MyTodoState createState() => _MyTodoState();
}

class _MyTodoState extends State<MyTodo> {
  List todo = List.empty(growable: true);
  String input = "";

  @override
  void initState() {
    super.initState();

    todo.add('Item 1');
    todo.add('Item 2');
    todo.add('Item 3');
    todo.add('Item 4');
    todo.add('Item 5');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Todos',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.normal,
            fontStyle: FontStyle.normal,
            letterSpacing: 0.6,
          ),
        ),
        elevation: 0.0,
      ),
      body: ListView.builder(
        itemCount: todo.length,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
              key: Key(todo[index]),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9),
                ),
                margin: EdgeInsets.all(1.5),
                color: Colors.white,
                elevation: 3.0,
                child: ListTile(
                  title: Text(todo[index]),
                  trailing: IconButton(
                    onPressed: () {
                      setState(() {
                        todo.removeAt(index);
                      });
                    },
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                ),
              ));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Add New Todo List'),
                  content: TextField(
                    onChanged: (String value) {
                      input = value;
                    },
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        setState(() {
                          todo.add(input);
                        });
                      },
                      child: Text('Add'),
                    ),
                  ],
                );
              });
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
