import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    //below line "debugShowCheckedModeBanner: false," is used to remove debug banner from app
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        title: Text(
          'Clickable Rolling Dice App',
          style: TextStyle(
            color: Colors.yellow,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: DicePage(),
    ),
  ));
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  String rolled_dice = 'None';
  int top_left = 1;
  int top_right = 6;
  int bottom_left = 6;
  int bottom_right = 1;

  Expanded left() {
    return Expanded(
      child: FlatButton(
        onPressed: () {
          setState(() {
            rolled_dice = '';
            rolled_dice = 'Top Left';
            top_left = Random().nextInt(5) + 1;
          });
        },
        child: Image.asset(
          'images/dice$top_left.png',
          color: Colors.black,
        ),
      ),
    );
  }

  Expanded right() {
    return Expanded(
      child: FlatButton(
        onPressed: () {
          setState(() {
            rolled_dice = '';
            rolled_dice = 'Top Right';
            top_right = Random().nextInt(5) + 1;
          });
        },
        child: Image.asset(
          'images/dice$top_right.png',
          color: Colors.black,
        ),
      ),
    );
  }

  Expanded upper() {
    return Expanded(
      child: FlatButton(
        onPressed: () {
          setState(() {
            rolled_dice = '';
            rolled_dice = 'Bottom Left';
            bottom_left = Random().nextInt(5) + 1;
          });
        },
        child: Image.asset(
          'images/dice$bottom_left.png',
          color: Colors.black,
        ),
      ),
    );
  }

  Expanded lower() {
    return Expanded(
      child: FlatButton(
        onPressed: () {
          setState(() {
            rolled_dice = '';
            rolled_dice = 'Bottom Right';
            bottom_right = Random().nextInt(5) + 1;
          });
        },
        child: Image.asset(
          'images/dice$bottom_right.png',
          color: Colors.black,
        ),
      ),
    );
  }

  Container top_dices() {
    return Container(
      child: Row(
        children: [
          left(),
          right(),
        ],
      ),
    );
  }

  Container bottom_dices() {
    return Container(
      child: Row(
        children: [
          upper(),
          lower(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Rolled Dice: $rolled_dice'.toString(),
                      style: TextStyle(
                        color: Colors.red.shade500,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      'Score is: ' +
                          (top_left + top_right + bottom_left + bottom_right)
                              .toString(),
                      style: TextStyle(
                        color: Colors.green.shade500,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 70.0,
        ),
        top_dices(),
        SizedBox(
          height: 70.0,
        ),
        bottom_dices(),
      ],
    );
  }
}
