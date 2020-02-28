import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(DicePage());
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  var leftDice = 1;
  var rightDice = 1;
  var total = 0;

  void rolldice() {
    setState(() {
      leftDice = Random().nextInt(6) + 1;
      rightDice = Random().nextInt(6) + 1;
    //get total of dice value rolled
      total = leftDice + rightDice;
      
    });
  }

  void reset() {
    setState(() {
      leftDice = 1;
      rightDice = 1;
      total = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade600,
        appBar: AppBar(
          title: Text('New Dicee'),
          backgroundColor: Colors.grey.shade600,
        ),
        body: Column(
          children: <Widget>[
            SizedBox(
              height: 40.0,
            ),
            Text(
              'Score: $total',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
            ),
            SizedBox(
              height: 60.0,
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Image.asset('images/dice$leftDice.png'),
                  ),
                  SizedBox(width: 15.9),
                  Expanded(
                    child: Image(
                      image: AssetImage('images/dice$rightDice.png'),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 100.0,
            ),
            Container(
              height: 60.0,
              margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade50,
                    offset: Offset(5.0, 5.0),
                  ),
                ],
              ),
              child: ButtonBar(
                alignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      rolldice();
                    },
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.green.shade400,
                      size: 50.0,
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  FlatButton(
                    onPressed: () {
                      reset();
                    },
                    child: Icon(
                      Icons.restore,
                      color: Colors.red.shade400,
                      size: 40.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

