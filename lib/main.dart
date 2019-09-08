import 'package:flutter/material.dart';

void main() => runApp(MyCalculatorApp());

class MyCalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My Calculator",
      home: MyCalculator(),
    );
  }
}

class MyCalculator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Calculator();
}

class Calculator extends State<MyCalculator> {
  final controller_numberA = TextEditingController();
  final controller_numberB = TextEditingController();

  final my_form_key = GlobalKey<FormState>();

  String textToShow = "";

  void sum() {
    if (my_form_key.currentState.validate()) {
      int numberA = int.parse(controller_numberA.text);
      int numberB = int.parse(controller_numberB.text);

      int result = numberA + numberB;

      setState(() {
        textToShow = "$numberA + $numberB = $result";
      });
    }
  }

  void minus() {
    if (my_form_key.currentState.validate()) {
      int numberA = int.parse(controller_numberA.text);
      int numberB = int.parse(controller_numberB.text);

      int result = numberA - numberB;

      setState(() {
        textToShow = "$numberA - $numberB = $result";
      });
    }
  }

  void Times() {
    if (my_form_key.currentState.validate()) {
      int numberA = int.parse(controller_numberA.text);
      int numberB = int.parse(controller_numberB.text);

      int result = numberA * numberB;

      setState(() {
        textToShow = "$numberA * $numberB = $result";
      });
    }
  }

  void Divide() {
    if (my_form_key.currentState.validate()) {
      int numberA = int.parse(controller_numberA.text);
      int numberB = int.parse(controller_numberB.text);

      double result = numberA / numberB;

      setState(() {
        textToShow = "$numberA / $numberB = $result";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Form(
        key: my_form_key,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: controller_numberA,
              validator: (value) {
                if (value.isEmpty) return "Please input some values";
              },
              decoration: InputDecoration(hintText: "Enter Number"),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              controller: controller_numberB,
              validator: (value) {
                if (value.isEmpty) return "Please input some values";
              },
              decoration: InputDecoration(hintText: "Enter Number"),
              keyboardType: TextInputType.number,
            ),
            Text(
              textToShow,
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  onPressed: sum,
                  child: Text('+'),
                ),
                RaisedButton(
                  onPressed: minus,
                  child: Text('-'),
                ),
                RaisedButton(
                  onPressed: Times,
                  child: Text('*'),
                ),
                RaisedButton(
                  onPressed: Divide,
                  child: Text('/'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
