import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: InputScreen(),
  ));
}

class InputScreen extends StatefulWidget {
  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController departmentController = TextEditingController();
  final TextEditingController rollNumberController = TextEditingController();

  void navigateToDisplayScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DisplayScreen(
          nameController.text,
          departmentController.text,
          rollNumberController.text,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Screen'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: departmentController,
                decoration: InputDecoration(labelText: 'Department'),
              ),
              TextField(
                controller: rollNumberController,
                decoration: InputDecoration(labelText: 'Roll Number'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  navigateToDisplayScreen(context);
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DisplayScreen extends StatelessWidget {
  final String name;
  final String department;
  final String rollNumber;

  DisplayScreen(this.name, this.department, this.rollNumber);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Display Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Name: $name', style: TextStyle(fontSize: 20)),
            Text('Department: $department', style: TextStyle(fontSize: 20)),
            Text('Roll Number: $rollNumber', style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
