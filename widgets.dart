import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {

  final String text;
  final Function callback;

  const CalculatorButton({
    required this.text,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return
   Container(
     margin: EdgeInsets.all(10.0),
    child:SizedBox(
    width: 70,
    height: 70,
       child: TextButton(
        style: ButtonStyle(
           backgroundColor: MaterialStateProperty.all<Color>(Colors.blueGrey),
           shape:
                 MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                ),
              ),
             ),
           child: Text(
           text,
           style: TextStyle(fontSize: 24.0, color: Colors.black54),
          ),
        onPressed: ()=> callback(text),
           ),
         )
   );
  }
}
