import 'package:flutter/material.dart';
import './themee.dart';
import 'package:math_expressions/math_expressions.dart';
import 'dart:math';

void main(List<String> args) {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  Color culor = Color.fromARGB(0, 3, 240, 229).withOpacity(0.4).withGreen(255);
  //var userInput = "";
  var resultOut = "";
  var _displayText = '';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Calculator"),
        ),
        body: Stack(
          children: [
            Container(
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(20),
                              alignment: Alignment.centerRight,
                              child: Text(
                                _displayText,
                                style: const TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(15),
                              alignment: Alignment.centerRight,
                              child: Text(
                                resultOut,
                                style: const TextStyle(
                                    fontSize: 30,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ]),
                    ),
                  ),
                  Stack(
                    children: [
                      Card(
                        //the image behind the keyboard
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25))),
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(25)),
                          child: Image.asset(
                            "assets/images/keyboard.jpg",
                            fit: BoxFit.fill,
                            height: 280,
                          ),
                        ),
                      ),
                      //starting of the buttons of keyboard
                      Card(
                        color: Colors.transparent.withOpacity(0),
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25))),
                        elevation: 20,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Card(
                                    shadowColor: Colors.greenAccent,
                                    color: culor,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    elevation: 10,
                                    child: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _displayText = '';
                                            resultOut = '0';
                                          });
                                        },
                                        icon: const Text(
                                          "AC",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 25,
                                              fontStyle: FontStyle.italic),
                                        ))),
                                Card(
                                    shadowColor: Colors.greenAccent,
                                    color: culor,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    elevation: 10,
                                    child: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _displayText =
                                                _displayText.substring(
                                                    0, _displayText.length - 1);
                                            resultOut = "0";
                                          });
                                        },
                                        icon: const Icon(
                                          Icons.backspace,
                                          color: Colors.red,
                                        ))),
                                Card(
                                    shadowColor: Colors.greenAccent,
                                    color: culor,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    elevation: 10,
                                    child: IconButton(
                                        onPressed: () {
                                          int n = int.parse(_displayText);

                                          int factorial = 1;
                                          int i = 1;
                                          while (i <= n) {
                                            factorial *= i;
                                            i++;
                                          }

                                          setState(() {
                                            String d = factorial.toString();
                                            resultOut = d;
                                          });
                                        },
                                        icon: const Text(
                                          "! Fact",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 25,
                                              fontStyle: FontStyle.italic),
                                        ))),
                                Card(
                                  shadowColor: Colors.greenAccent,
                                  color: culor,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  elevation: 10,
                                  child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        double y = double.parse(_displayText);
                                        double x = sqrt(y);
                                        resultOut = x.toString();
                                      });
                                    },
                                    icon: const Text("Sqrt",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 25,
                                            fontStyle: FontStyle.italic)),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Card(
                                    shadowColor: Colors.greenAccent,
                                    color: culor,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    elevation: 10,
                                    child: IconButton(
                                        onPressed: () => showUserInput("1"),
                                        icon: const Text(
                                          "1",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 25,
                                              fontStyle: FontStyle.italic),
                                        ))),
                                Card(
                                    shadowColor: Colors.greenAccent,
                                    color: culor,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    elevation: 10,
                                    child: IconButton(
                                        onPressed: () => showUserInput("2"),
                                        icon: const Text(
                                          "2",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 25,
                                              fontStyle: FontStyle.italic),
                                        ))),
                                Card(
                                    shadowColor: Colors.greenAccent,
                                    color: culor,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    elevation: 10,
                                    child: IconButton(
                                        onPressed: () => showUserInput("3"),
                                        icon: const Text(
                                          "3",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 25,
                                              fontStyle: FontStyle.italic),
                                        ))),
                                Card(
                                    shadowColor: Colors.greenAccent,
                                    color: culor,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    elevation: 10,
                                    child: IconButton(
                                        onPressed: () => showUserInput("x"),
                                        icon: const Text(
                                          "x",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 25,
                                              fontStyle: FontStyle.italic),
                                        ))),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Card(
                                    shadowColor: Colors.greenAccent,
                                    color: culor,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    elevation: 10,
                                    child: IconButton(
                                        onPressed: () => showUserInput("4"),
                                        icon: const Text(
                                          "4",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 25,
                                              fontStyle: FontStyle.italic),
                                        ))),
                                Card(
                                    shadowColor: Colors.greenAccent,
                                    color: culor,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    elevation: 10,
                                    child: IconButton(
                                        onPressed: () => showUserInput("5"),
                                        icon: const Text(
                                          "5",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 25,
                                              fontStyle: FontStyle.italic),
                                        ))),
                                Card(
                                    shadowColor: Colors.greenAccent,
                                    color: culor,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    elevation: 10,
                                    child: IconButton(
                                        onPressed: () => showUserInput("6"),
                                        icon: const Text(
                                          "6",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 25,
                                              fontStyle: FontStyle.italic),
                                        ))),
                                Card(
                                    shadowColor: Colors.greenAccent,
                                    color: culor,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    elevation: 10,
                                    child: IconButton(
                                        onPressed: () => showUserInput("/"),
                                        icon: const Text(
                                          "/",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 25,
                                              fontStyle: FontStyle.italic),
                                        ))),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Card(
                                    shadowColor: Colors.greenAccent,
                                    color: culor,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    elevation: 10,
                                    child: IconButton(
                                        onPressed: () => showUserInput("7"),
                                        icon: const Text(
                                          "7",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 25,
                                              fontStyle: FontStyle.italic),
                                        ))),
                                Card(
                                    shadowColor: Colors.greenAccent,
                                    color: culor,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    elevation: 10,
                                    child: IconButton(
                                        onPressed: () => showUserInput("8"),
                                        icon: const Text(
                                          "8",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 25,
                                              fontStyle: FontStyle.italic),
                                        ))),
                                Card(
                                    shadowColor: Colors.greenAccent,
                                    color: culor,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    elevation: 10,
                                    child: IconButton(
                                        onPressed: () => showUserInput("9"),
                                        icon: const Text(
                                          "9",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 25,
                                              fontStyle: FontStyle.italic),
                                        ))),
                                Card(
                                    shadowColor: Colors.greenAccent,
                                    color: culor,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    elevation: 10,
                                    child: IconButton(
                                        onPressed: () => showUserInput("+"),
                                        icon: const Text(
                                          "+",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 25,
                                              fontStyle: FontStyle.italic),
                                        ))),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Card(
                                    shadowColor: Colors.greenAccent,
                                    color: culor,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    elevation: 10,
                                    child: IconButton(
                                      onPressed: () => showUserInput("."),
                                      icon: const Text(
                                        ".",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 25,
                                            fontStyle: FontStyle.italic),
                                      ),
                                    )),
                                Card(
                                    shadowColor: Colors.greenAccent,
                                    color: culor,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    elevation: 10,
                                    child: IconButton(
                                        onPressed: () => showUserInput("0"),
                                        icon: const Text(
                                          "0",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 25,
                                              fontStyle: FontStyle.italic),
                                        ))),
                                Card(
                                    shadowColor: Colors.greenAccent,
                                    color: culor,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    elevation: 10,
                                    child: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            equalTap();
                                          });
                                        },
                                        icon: const Text(
                                          "=",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 25,
                                              fontStyle: FontStyle.italic),
                                        ))),
                                Card(
                                    shadowColor: Colors.greenAccent,
                                    color: culor,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    elevation: 10,
                                    child: IconButton(
                                      onPressed: () => showUserInput("-"),
                                      icon: const Text(
                                        "-",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 25,
                                            fontStyle: FontStyle.italic),
                                      ),
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

//on tapp the equall button
  void equalTap() {
    String finaluserinput = _displayText;
    finaluserinput = _displayText.replaceAll('x', '*');

    Parser pr = Parser();
    Expression expr = pr.parse(finaluserinput);
    ContextModel cm = ContextModel();
    double eval = expr.evaluate(EvaluationType.REAL, cm);
    resultOut = eval.toString();
  }

//to display the user input
  void showUserInput(String value) {
    setState(() {
      _displayText += value;
    });
  }
}
