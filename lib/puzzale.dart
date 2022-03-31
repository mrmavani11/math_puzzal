import 'package:flutter/material.dart';
import 'package:math_puzzal/continue.dart';
import 'package:math_puzzal/model.dart';
import 'package:math_puzzal/next.dart';

class puzzale extends StatefulWidget {
  int cnt;

  puzzale(this.cnt);

  @override
  _puzzaleState createState() => _puzzaleState();
}

class _puzzaleState extends State<puzzale> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
              width: double.infinity,
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 50),
                    padding: EdgeInsets.all(20),
                    child: Text(
                      "Select Puzzle",
                      style: TextStyle(fontSize: 30, fontFamily: 'f1'),
                    ),
                  ),
                  Container(
                    //   margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
                    height: 600,
                    child: GridView.builder(
                      itemCount: model.st.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          //mainAxisSpacing: 10,
                        //  crossAxisSpacing: 10
                      ),
                      itemBuilder: (context, index) {
                        int cnt = model.prefs!.getInt("cnt") ?? 0;
                       // String status = model.st[index];
                        if (model.st[index] == "clear") {
                          return InkWell(
                            onTap: () {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(
                                builder: (context) {
                                  return continue_1(index);
                                },
                              ));
                            },
                            child: Container(
                              alignment: Alignment.center,
                              child: Text("${index + 1}"),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("myimage/tick.png"))),
                            ),
                          );
                        } else if (model.st[index] == "skip") {
                          return InkWell(
                            onTap: () {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(
                                builder: (context) {
                                  return continue_1(index);
                                },
                              ));
                            },
                            child: Container(
                              alignment: Alignment.center,
                              child: Text("${index + 1}"),
                            ),
                          );
                        } else {
                          if (index == cnt) {
                            return InkWell(
                              onTap: () {
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(
                                  builder: (context) {
                                    return continue_1(index);
                                  },
                                ));
                              },
                              child: Container(
                                alignment: Alignment.center,
                                child: Text("${index + 1}"),
                              ),
                            );
                          } else {
                            return Container(
                              alignment: Alignment.center,
                              child: Text(""),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("myimage/lock.png"))),
                            );
                          }
                        }
                      },
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return next(widget.cnt);
                          },
                        ));
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      margin: EdgeInsets.only(left: 300),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("my_images/next.png"))),
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("my_images/background.jpg"),
                      fit: BoxFit.fill)))),
    );
  }
}
