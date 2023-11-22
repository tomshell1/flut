import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyHomePage(),
  ));
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color textColor = Colors.black;
  double fontSize = 20.0;

  void changeColor(Color color) {
    setState(() {
      textColor = color;
    });
  }

  void changeFontSize(double size) {
    setState(() {
      fontSize = size;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Style Changer'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Hello',
              style: TextStyle(
                color: textColor,
                fontSize: fontSize,
              ),
            ),
            Text(
              'Sushmitha',
              style: TextStyle(
                color: textColor,
                fontSize: fontSize,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                changeColor(Colors.red);
              },
              child: Text('Change Color to Red'),
            ),
            ElevatedButton(
              onPressed: () {
                changeColor(Colors.blue);
              },
              child: Text('Change Color to Blue'),
            ),
            ElevatedButton(
              onPressed: () {
                changeFontSize(30.0);
              },
              child: Text('Increase Font Size'),
            ),
          ],
        ),
      ),
    );
  }
}
