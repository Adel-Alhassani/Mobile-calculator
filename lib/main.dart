// import 'dart:html';

// import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:function_tree/function_tree.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const CalculatorPage(),
    );
  }
}

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String mathExpression = "";
  String result = "0";
  bool isBracketOpen = false;
  RegExp regex = RegExp(r'([.]*0)(?!.*\d)');

  backSpace() {
    mathExpression = mathExpression.substring(0, mathExpression.length - 1);
    setState(() {});
  }

  clear() {
    mathExpression = "";
    result = "0";
    setState(() {});
  }

  void addText(String text) {
    mathExpression = mathExpression + text;
    setState(() {});
  }

  addBracket() {
    if (isBracketOpen) {
      isBracketOpen = false;
      return addText(")");
    } else {
      isBracketOpen = true;
      if (mathExpression.length>=1 && !mathExpression[mathExpression.length - 1]
          .contains(RegExp(r'[%-+÷×.]'))) {
        return addText("×(");
      }
      return addText("(");
    }
  }

  equal() {
    try {
      String tempMathExp = mathExpression.replaceAll("÷", "/");
      tempMathExp = tempMathExp.replaceAll("×", "*");
      result = tempMathExp.interpret().toString().replaceAll(regex, "");
      mathExpression = result;
    } catch (e) {
      result = "Invalid";
    }

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        color: Colors.black,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 60,
                margin: EdgeInsets.only(top: 20, bottom: 40),
                alignment: Alignment.centerRight,
                child: Text(
                  result,
                  style: TextStyle(fontSize: 44, color: Colors.white),
                ),
              ),
              Column(
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Container(
                              child: Text(mathExpression,
                                  style: TextStyle(
                                      fontSize: 36, color: Colors.white)),
                              // color: Colors.yellow,
                            )
                          ],
                        ),
                        IconButton(
                            onPressed: () {
                              backSpace();
                            },
                            icon: Icon(
                              Icons.backspace_outlined,
                              color: Color(0xFF4DC722),
                              size: 30,
                            ))
                      ],
                    ),
                  ),
                  Container(
                    height: 1.5,
                    margin: EdgeInsets.only(top: 5, bottom: 20),
                    width: double.infinity,
                    color: Colors.white,
                  ),
                  Container(
                    height: 430,
                    // color: Colors.red,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            CustomeButton(
                              text: "C",
                              textColor: Color(0xFFFF4D00),
                              flex: 1,
                              onPressed: () {
                                clear();
                              },
                            ),
                            CustomeButton(
                              text: "( )",
                              textColor: Color(0xFF4DC722),
                              flex: 1,
                              onPressed: () => addBracket(),
                            ),
                            CustomeButton(
                              text: "%",
                              textColor: Color(0xFF4DC722),
                              flex: 1,
                              onPressed: () => addText("%"),
                            ),
                            CustomeButton(
                              text: "÷",
                              textColor: Color(0xFF4DC722),
                              flex: 1,
                              onPressed: () => addText("÷"),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            CustomeButton(
                              text: "7",
                              textColor: Colors.white,
                              flex: 1,
                              onPressed: () => addText("7"),
                            ),
                            CustomeButton(
                              text: "8",
                              textColor: Colors.white,
                              flex: 1,
                              onPressed: () => addText("8"),
                            ),
                            CustomeButton(
                              text: "9",
                              textColor: Colors.white,
                              flex: 1,
                              onPressed: () => addText("9"),
                            ),
                            CustomeButton(
                              text: "×",
                              textColor: Color(0xFF4DC722),
                              flex: 1,
                              onPressed: () => addText("×"),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            CustomeButton(
                              text: "4",
                              textColor: Colors.white,
                              flex: 1,
                              onPressed: () => addText("4"),
                            ),
                            CustomeButton(
                              text: "5",
                              textColor: Colors.white,
                              flex: 1,
                              onPressed: () => addText("5"),
                            ),
                            CustomeButton(
                              text: "6",
                              textColor: Colors.white,
                              flex: 1,
                              onPressed: () => addText("6"),
                            ),
                            CustomeButton(
                              text: "-",
                              textColor: Color(0xFF4DC722),
                              flex: 1,
                              onPressed: () => addText("-"),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            CustomeButton(
                              text: "1",
                              textColor: Colors.white,
                              flex: 1,
                              onPressed: () => addText("1"),
                            ),
                            CustomeButton(
                              text: "2",
                              textColor: Colors.white,
                              flex: 1,
                              onPressed: () => addText("2"),
                            ),
                            CustomeButton(
                              text: "3",
                              textColor: Colors.white,
                              flex: 1,
                              onPressed: () => addText("3"),
                            ),
                            CustomeButton(
                              text: "+",
                              textColor: Color(0xFF4DC722),
                              flex: 1,
                              onPressed: () => addText("+"),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            CustomeButton(
                              text: ".",
                              textColor: Colors.white,
                              flex: 1,
                              onPressed: () => addText("."),
                            ),
                            CustomeButton(
                              text: "0",
                              textColor: Colors.white,
                              flex: 1,
                              onPressed: () => addText("0"),
                            ),
                            Expanded(
                              flex: 2,
                              child: MaterialButton(
                                  padding: EdgeInsets.symmetric(vertical: 7),
                                  onPressed: () {
                                    equal();
                                  },
                                  child: Text("=",
                                      style: TextStyle(
                                          fontSize: 36, color: Colors.white)),
                                  color: Color(0xFF008E06),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30)))),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              )
            ]),
      ),
    );
  }
}

class CustomeButton extends StatefulWidget {
  final String text;
  final Color textColor;
  final int flex;
  final VoidCallback onPressed;
  const CustomeButton(
      {super.key,
      required this.text,
      required this.textColor,
      required this.flex,
      required this.onPressed});

  @override
  State<CustomeButton> createState() => _CustomeButtonState();
}

class _CustomeButtonState extends State<CustomeButton> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: widget.flex,
      child: MaterialButton(
        padding: EdgeInsets.symmetric(vertical: 12),
        onPressed: widget.onPressed,
        child: Text(widget.text,
            style: TextStyle(fontSize: 36, color: widget.textColor)),
        color: Color(0xFF282828),
        shape: CircleBorder(),
      ),
    );
  }
}
