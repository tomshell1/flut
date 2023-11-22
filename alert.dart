import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AlertDialog Example',
      home: Scaffold(
        appBar: AppBar(
          title: Text('AlertDialog Example'),
        ),
        body: Builder(
          builder: (BuildContext buildercontext) {
            return Center(
              child: ElevatedButton(
                onPressed: () {
                  // Show the alert dialog when the button is pressed
                  _showAlertDialog(buildercontext);
                },
                child: Text('Show Alert Dialog'),
              ),
            );
          }
        ),
      ),
    );
  }
}


  // Function to show the alert dialog
void _showAlertDialog(BuildContext context){
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text('alert message'),
            content: Text('this is an alert message'),
            actions: [
              TextButton(
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                  child: Text('ok'),
              )
            ],
          );
        }
        );
}
