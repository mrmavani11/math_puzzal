import 'package:flutter/material.dart';
import 'package:math_puzzal/model.dart';
import 'package:math_puzzal/puzzale.dart';
import 'package:math_puzzal/win.dart';
import 'package:shared_preferences/shared_preferences.dart';
class continue_1 extends StatefulWidget {

  int cnt;
  continue_1(this.cnt);

  @override
  _continue_1State createState() => _continue_1State();
}

class _continue_1State extends State<continue_1> {
  String add = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
            width: double.infinity,
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {

                          widget.cnt++;

                        });
                      },
                      child:   Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("my_images/skip.png"))),
                      ),
                    ),
                    Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          padding: EdgeInsets.all(10),
                          height: 50,
                          alignment: Alignment.center,
                          child: Text(
                            "Puzzal 1",
                            style: TextStyle(fontSize: 20),
                          ),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("my_images/level_board.png"))),
                        )),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("my_images/hint.png"))),
                    ),
                  ],
                ),
                Expanded(
                    child: Container(
                      margin: EdgeInsets.only(bottom: 330, left: 10, right: 10),
                      decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage(model.img[widget.cnt]))),
                    )),

                Container(
                  height: 50,
                  color: Colors.black,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.all(8),
                          color: Colors.white,
                          child: Text("${add}"),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(5),
                        child: ElevatedButton(onPressed: () {

                          setState(() {
                            add = '';
                          });

                        }, child: Icon(Icons.backspace_outlined)),
                      ),
                      Container(
                        margin: EdgeInsets.all(5),
                        child: ElevatedButton(onPressed: () {
                          setState(() {
                            if(add==model.ans[widget.cnt]){
                              if(model.st[widget.cnt]=="clear"){
                                Navigator.pushReplacement(context, MaterialPageRoute(
                                  builder: (context) {
                                    return puzzale(widget.cnt);
                                  },
                                ));
                              }else if(model.st[widget.cnt]=="skip"){
                                model.prefs!.setString("status${widget.cnt}", "clear");

                                model.st[widget.cnt] = "clear";

                              }else{
                                model.prefs!.setString("st${widget.cnt}", "clear");

                                model.st[widget.cnt]="clear";
                                widget.cnt = widget.cnt+1;

                                model.prefs!.setInt("cnt", widget.cnt);
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                                  return win(widget.cnt);
                                },));
                              }
                            }
                            // math_puzzal.!.setInt('counter',cnt!);
                          });

                        }, child: Text("SUBMIT")),
                      )
                    ],
                  ),
                ) ,

                Container(
                  height: 50,
                  child: GridView.builder(
                    itemCount: model.a.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 10),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            add = add + model.a[index];
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          child: Text("${model.a[index]}",style: TextStyle(color: Colors.white),),
                          decoration: BoxDecoration(
                              color: Colors.black54,
                              border: Border.all(color: Colors.white)
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("my_images/gameplaybackground.jpg"),
                    fit: BoxFit.fill)),
          ))
    );
  }
}