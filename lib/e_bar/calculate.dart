import 'package:flutter/material.dart';

import 'package:math_expressions/math_expressions.dart';
import 'package:sittiwat_app/model/my_style.dart';

class Calculate extends StatefulWidget {
  const Calculate({Key? key}) : super(key: key);

  @override
  _CalculateState createState() => _CalculateState();
}

class _CalculateState extends State<Calculate> {
  String result = "0";
  String expression = "";
  buttonPressed(String value) {
    setState(() {
      if (value == "CLEAR") {
        result = "0";
      } else if (value == ".") {
        if (result.contains(".")) {
          return;
        } else {
          result = result + value;
        }
      } else if (value == "=") {
        expression = result.replaceAll("X", "*");
        Parser p = Parser();
        Expression exp = p.parse(expression);
        ContextModel cm = ContextModel();
        dynamic calculate = exp.evaluate(EvaluationType.REAL, cm);
        result = "$calculate";
      } else {
        if (result == "0") {
          result = value;
        } else {
          result = result + value;
        }
      }
    });
  }

  Widget myButton(String buttonLabel) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: ElevatedButton(
           style: ElevatedButton.styleFrom(
          primary: Colors.blueGrey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
            onPressed: () => buttonPressed(buttonLabel),
            child: MyStyle().fonWhite25(buttonLabel)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar
      (title: MyStyle().fonorange25("Thai...KASET HEY"),
        backgroundColor: Colors.grey.shade300,),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 150,
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                alignment: Alignment.centerRight,
                child: MyStyle().fongreen40(result),
              ),
              
              Column(
                children: [
                  Row(
                    children: [
                      myButton("7"),
                      myButton("8"),
                      myButton("9"),
                      myButton("/"),
                    ],
                  ),
                  Row(
                    children: [
                      myButton("4"),
                      myButton("5"),
                      myButton("6"),
                      myButton("X"),
                    ],
                  ),
                  Row(
                    children: [
                      myButton("1"),
                      myButton("2"),
                      myButton("3"),
                      myButton("-"),
                    ],
                  ),
                  Row(
                    children: [
                      myButton("."),
                      myButton("0"),
                      myButton("00"),
                      myButton("+"),
                    ],
                  ),
                  Row(
                    children: [
                      myButton("CLEAR"),
                      myButton("="),
                    ],
                  ),
                ],
              ),
             
              SizedBox(width: 120,child:MyStyle().showLogo() ,)
              
        
            ],
            
          ),
        ),
      ),
    );
  }
}
