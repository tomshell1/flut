import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DiceApp(),
      ),
    ),
  );
}

class DiceApp extends StatefulWidget {
  const DiceApp({super.key});

  @override
  State<DiceApp> createState() => _DiceAppState();
}

class _DiceAppState extends State<DiceApp> {
  int leftdicenumber = 1;
  int rightdicenumber =1;

  void dicechange(){
    setState(
          () {
        {
          leftdicenumber = Random().nextInt(6) + 1;
          rightdicenumber = Random().nextInt(6) + 1;
        }
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: TextButton(
              onPressed: () {
                dicechange();
                print('left dice changed to $leftdicenumber');
              },
              child: Image.asset('images/dice$leftdicenumber.png'),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: () {
                dicechange();
                print('right dice changed to $rightdicenumber');
              },
              child: Image.asset('images/dice$rightdicenumber.png'),
            ),
          )
        ],
      ),
    );
  }
}

// class DiceApp extends StatelessWidget {
//   const DiceApp({super.key});
//
//
// }

//Image(
//           image: AssetImage('images/dice1.png'),
//         ),
