import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:math_puzzal/continue.dart';

class win extends StatefulWidget {
  int cnt;
  win(this.cnt);


  @override
  _winState createState() => _winState();
}

class _winState extends State<win> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
          child: Center(
            child: InkWell(
              onTap: () {
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return continue_1(widget.cnt);
                  },));
                });
              },
              child: Container(
                alignment: Alignment.center,
                child: Text("Continue",style: TextStyle(fontSize: 30,color: Colors.black,fontFamily: 'f1'),),
              ),
            )
          ),
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("my_images/background.jpg"),fit: BoxFit.fill)
        ),
      )
      
    );
  }
}
