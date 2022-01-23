import 'package:math_expressions/math_expressions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'button.dart';

void main() {
  runApp(CalcApp());
}

class CalcApp extends StatefulWidget {
  const CalcApp({Key? key}) : super(key: key);

  @override
  CalcAppState createState() => CalcAppState();
}

class CalcAppState extends State<CalcApp> {
  String _history = '';
  String _expression = '';

  void numClick(String text) {
    setState(() => _expression += text);
  }

  void allClear(String text) {
    setState(() {
      _history = '';
      _expression = '';
    });
  }

  void clear(String text) {
    setState(() {
      _expression = '';
    });
  }

  void evaluate(String text) {
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();

    setState(() {
      _history = _expression;
      _expression = exp.evaluate(EvaluationType.REAL, cm).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Center(
            child: Text("Calculator App"),
          ),
        ),
        backgroundColor: Colors.green,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Text(
                      _history,
                      style: GoogleFonts.rubik(
                        textStyle: TextStyle(
                          fontSize: 24,
                          backgroundColor: Colors.purple,
                        ),
                      ),
                    ),
                  ),
                  alignment: Alignment(1.0, 1.0),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      _expression,
                      style: GoogleFonts.rubik(
                        textStyle: TextStyle(
                          fontSize: 48,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  alignment: Alignment(1.0, 1.0),
                ),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CalcButton(
                      text: 'AC',
                      fillColor: 0xFF03045e,
                      textColor: 0xFFfefae0,
                      textSize: 20,
                      callback: allClear,
                    ),
                    CalcButton(
                      text: 'C',
                      fillColor: 0xFF03045e,
                      textColor: 0xFFfefae0,
                      callback: clear,
                    ),
                    CalcButton(
                      text: '%',
                      fillColor: 0xFF03045e,
                      textColor: 0xFFfefae0,
                      callback: numClick,
                    ),
                    CalcButton(
                      text: '/',
                      fillColor: 0xFFffb383,
                      textColor: 0xFF03071e,
                      callback: numClick,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CalcButton(
                      text: '7',
                      fillColor: 0xFFffb803,
                      callback: numClick,
                    ),
                    CalcButton(
                      text: '8',
                      fillColor: 0xFFffb803,
                      callback: numClick,
                    ),
                    CalcButton(
                      text: '9',
                      fillColor: 0xFFffb803,
                      callback: numClick,
                    ),
                    CalcButton(
                      text: 'x',
                      fillColor: 0xFFffb383,
                      textColor: 0xFF03071e,
                      textSize: 24,
                      callback: numClick,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CalcButton(
                      text: '4',
                      fillColor: 0xFFffb803,
                      callback: numClick,
                    ),
                    CalcButton(
                      text: '5',
                      fillColor: 0xFFffb803,
                      callback: numClick,
                    ),
                    CalcButton(
                      text: '6',
                      fillColor: 0xFFffb803,
                      callback: numClick,
                    ),
                    CalcButton(
                      text: '-',
                      fillColor: 0xFFffb383,
                      textColor: 0xFF03071e,
                      textSize: 38,
                      callback: numClick,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CalcButton(
                      text: '1',
                      fillColor: 0xFFffb803,
                      callback: numClick,
                    ),
                    CalcButton(
                      text: '2',
                      fillColor: 0xFFffb803,
                      callback: numClick,
                    ),
                    CalcButton(
                      text: '3',
                      fillColor: 0xFFffb803,
                      callback: numClick,
                    ),
                    CalcButton(
                      text: '+',
                      fillColor: 0xFFffb383,
                      textColor: 0xFF03071e,
                      textSize: 30,
                      callback: numClick,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CalcButton(
                      text: '0',
                      fillColor: 0xFFffb803,
                      callback: numClick,
                    ),
                    CalcButton(
                      text: '00',
                      fillColor: 0xFFffb803,
                      callback: numClick,
                      textSize: 26,
                    ),
                    CalcButton(
                      text: '.',
                      fillColor: 0xFFffb803,
                      callback: numClick,
                    ),
                    CalcButton(
                      text: '=',
                      fillColor: 0xFFffb383,
                      textColor: 0xFF03071e,
                      callback: evaluate,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
