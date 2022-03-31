import 'package:flutter/material.dart';
import 'package:math_puzzal/model.dart';
import 'package:math_puzzal/puzzale.dart';

class next extends StatefulWidget {
  int cnt;
  next(this.cnt);

  @override
  _nextState createState() => _nextState();
}

class _nextState extends State<next> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Container(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 50),
              padding: EdgeInsets.all(20),
              child: Text("Select Puzzle",style: TextStyle(fontSize: 30,fontFamily: 'f1'),),
            ),
          Container(
          //   margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
          height: 600,
          child:  GridView.builder(
            itemCount: 20,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,mainAxisSpacing: 10,crossAxisSpacing: 10), itemBuilder: (context, index) {
              index = index+21;
              if(widget.cnt >= index){
                return InkWell(
                  onTap: () {
                    setState(() {

                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    child: Text("${index}",style: TextStyle(color: Colors.black,fontSize: 30),),
                  ),
                );
              }else{
                return Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage("my_images/lock.png"))
                  ),
                );
              }
          },),
          ),

            InkWell(
              onTap: () {
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return puzzale(widget.cnt);
                  },));
                });
              },
              child:  Container(
                height: 50,
                width: 50,
                margin: EdgeInsets.only(right: 300),
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage("my_images/back.png"))
                ),
              ),
            )

          ],
        ),
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("my_images/background.jpg"),fit: BoxFit.fill)
        ),
      )),
    );
  }
}
