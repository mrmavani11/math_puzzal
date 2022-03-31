import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:math_puzzal/continue.dart';
import 'package:math_puzzal/model.dart';
import 'package:math_puzzal/puzzale.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(
    home: math_puzzal(),
  ));
}

class math_puzzal extends StatefulWidget {
  const math_puzzal({Key? key}) : super(key: key);

  @override
  _math_puzzalState createState() => _math_puzzalState();
}

class _math_puzzalState extends State<math_puzzal> {

  int? cnt ;
  int c = 0;
  bool st = false;

//  TextEditingController t  = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //  a1 = model.a;
    intpreaf();
  }

  intpreaf() async {


    model.prefs = await SharedPreferences.getInstance();

      cnt = model.prefs!.getInt('cnt') ?? 0;
    for(int i=0;i<20;i++)
    {
      String status = model.prefs!.getString("status$i") ?? "pending";
      model.st.add(status);
    }
    // [pending,pending,pending,pending,pending]
    print(model.st);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        width: double.infinity,
        child: Column(
          //  mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 30),
              child: Text(
                "MATH PUZZAL",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                    fontFamily: 'f1'),
              ),
            ),
            Expanded(
                child: Container(
                    margin: EdgeInsets.fromLTRB(10, 60, 10, 120),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                "my_images/blackboard_main_menu.png"),
                            fit: BoxFit.fill)),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return continue_1(cnt!);
                                    },
                                  ));
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.fromLTRB(90, 90, 0, 0),
                                child: Text(
                                  "CONTINUE",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 40,fontFamily: 'f1'),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return puzzale(cnt!);
                                    },
                                  ));
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.fromLTRB(90, 90, 0, 0),
                                child: Text(
                                  "PUZZLES",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 40,fontFamily: 'f1'),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {

                                });
                              },
                              child: Container(
                                margin: EdgeInsets.fromLTRB(90, 90, 0, 0),
                                child: Text(
                                  "BUY PRO",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 40,fontFamily: 'f1'),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ))),

          ],
        ),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("my_images/background.jpg"),
                fit: BoxFit.fill)),
      ),
    ));
  }
}
