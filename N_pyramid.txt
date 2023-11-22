import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pyramid App',
      home: PyramidScreen(),
    );
  }
}

class PyramidScreen extends StatefulWidget {
  @override
  _PyramidScreenState createState() => _PyramidScreenState();
}

class _PyramidScreenState extends State<PyramidScreen> {
  int n = 1; // Default value for n

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pyramid App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Enter value for n:',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 10.0),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  n = int.tryParse(value) ?? 1;
                });
              },
              decoration: InputDecoration(
                hintText: 'Enter a number',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Pyramid:',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 10.0),
            buildPyramid(),
          ],
        ),
      ),
    );
  }

  Widget buildPyramid() {
    List<Widget> rows = [];
    for (int i = 1; i <= n; i++) {
      rows.add(
        Center(
          child: Text(
            '*' * i,
            style: TextStyle(fontSize: 18.0),
          ),
        ),
      );
    }
    return Column(children: rows);
  }
}
