import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorPage(),
    );
  }
}

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String display = "";
  double num1 = 0;
  double num2 = 0;
  String expression = "0";
  String operator = "";

  void buttonPressed(String value) {
    setState(() {
      if ((value == "C")||(value == "AC")) {
        display = "";
        num1 = 0;
        num2 = 0;
        operator = "";
        expression = "0";
      } 
      else if (value == "+" || value == "-" || value == "*" || value == "/" || value == "^x" || value == "%" ||value=="^" || value=="&" || value=="|" || value == "+=") {
        num1 = double.parse(display);
        operator = value;
        expression = display + operator; 
        display = "0";
      } 
      else if (value == "=") {
        num2 = double.parse(display);

        double result = 0;
      if (operator == "&") result = (num1.toInt() & num2.toInt()).toDouble();
      if (operator == "|") result = (num1.toInt() | num2.toInt()).toDouble();
      if (operator == "^") result = (num1.toInt() ^ num2.toInt()).toDouble();
      if (operator == "+=") result = num1 += num2;
      if (operator == "%") result = num1 % num2;
      if (operator == "+") result = num1 + num2;
      if (operator == "-") result = num1 - num2;
      if (operator == "*") result = num1 * num2;
      if (operator == "/") result = num2 != 0 ? num1 / num2 : 0;
      if(operator == "^x")  result = pow(num1, num2).toDouble();

      expression = expression + display;
      display = result.toString();
      expression = display;
      } 
      else {
        if (display == "0") {
          display = value;
        } 
        else {
          display += value;
        }
        if (expression == "0") {
          expression = value;
        } 
        else {
          expression += value;
        }
        
      }
    });
  }

  Widget buildButton(String text) {
    return Expanded(
      child: Padding(
        
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 230, 225, 231),
          ),
          onPressed: () => buttonPressed(text),
          child:Text(text, style: TextStyle(fontSize: 24)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Calculator", style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700, color: Colors.blueGrey),)),
      body: Container(
        color: const Color.fromARGB(255, 202, 202, 206),
        child:Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.all(20),
              child:SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  reverse: true,
                  child:Text(expression, style: TextStyle(fontSize: 40, color: const Color.fromARGB(255, 98, 99, 98))),
                ),
              
            )
          ),
          
          Container(
            color: const Color.fromARGB(255, 115, 109, 116),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            Row(children: [
            buildButton("AC"),
            buildButton("C"),
            buildButton("^x"),
          ]),
            Row(children: [
            buildButton("%"),
            buildButton("|"),
            buildButton("^"),
            buildButton("&"),
          ]),
            Row(children: [
            buildButton("7"),
            buildButton("8"),
            buildButton("9"),
            buildButton("/"),
          ]),
          Row(children: [
            buildButton("4"),
            buildButton("5"),
            buildButton("6"),
            buildButton("*"),
          ]),
          Row(children: [
            buildButton("1"),
            buildButton("2"),
            buildButton("3"),
            buildButton("-"),
          ]),
          Row(children: [
            buildButton("0"),
            buildButton("."),
            buildButton("="),
            buildButton("+"),
          ]),
              ],
            ),
          ),
        ],
      ),
      )
    );
  }
}