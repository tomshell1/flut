import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('todo app'), 
            backgroundColor: Colors.pinkAccent
        ),
        body: TodoApp(),
      ),
    );
  }
}

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  List<String> todos=[];
  TextEditingController todocontroller = TextEditingController();


  void addTodo(){
    String newTodo =  todocontroller.text;
    if(newTodo.isNotEmpty){
      setState(() {
        todos.add(newTodo);
        todocontroller.clear();
      });
    }
  }


  void Removetodo(int index){
    setState(() {
      todos.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
              padding:EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: todocontroller,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(hintText: 'Enter a todo..',
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: (){
                      addTodo();
                    },
                    child: Text('add'),
                ),
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
                itemCount: todos.length,
                itemBuilder: (context,index){
                  return ListTile(
                    title: Text(todos[index]),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: (){
                        Removetodo(index);
                      },
                    ),
                  );
                },
              ),
          ),
        ],
      ),
    );
  }
}



/*class MyApp extends StatelessWidget {
  final List<String> fruits = ['Apple', 'Banana', 'Orange', 'Grapes', 'Watermelon'];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: Text('listview example'),
        ),
        body: ListView.builder(
          itemCount: fruits.length,
          itemBuilder: (context,index){
            return ListTile(
              title: Text(fruits[index]),
            );
          }
        ),
      ),
    );
  }
}*/
