import 'package:math_expressions/math_expressions.dart';
import "package:flutter/material.dart";

class calculator extends StatefulWidget {
  @override
  _calculatorState createState() => _calculatorState();
}

class _calculatorState extends State<calculator> {
  var res = "";

  Widget button(var name) {
    return Expanded(
      child: ElevatedButton(
          onPressed: () {
            setState(() {
              if (res.contains("/-+*") == true) {
                return;
              } else {
                res = res + name;
              }
            });
          },
          child: Text(
            name,
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 19,
            ),
          ),
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(),
              primary: Colors.blue,
              onPrimary: Colors.white,
              shadowColor: Colors.black87,
              elevation: 50,
              padding: EdgeInsets.symmetric(vertical: 25),
              side: BorderSide(width: 0.5, color: Colors.white))),
    );
  }

  ac() {
    setState(() {
      res = "";
    });
  }

  one() {
    setState(() {
      if (res != null && res.length > 0) {
        res = res.substring(0, res.length - 1);
      }
    });
  }

  output() {
    Parser p = Parser();
    Expression exp = p.parse(res);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    setState(() {
      res = eval.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(
                Icons.calculate,
                size: 25,
                color: Colors.blue[500],
              ),
              onPressed: () {}),
        ],
        elevation: 8,
        title: Text(
          "CALCULATOR",
          style: TextStyle(
              color: Colors.blue[500],
              fontSize: 25,
              fontFamily: "Halvetica",
              fontWeight: FontWeight.w900),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 80,
            decoration: BoxDecoration(
                color: Color(0xffFFFFFF),
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                )),
            child: Align(
              alignment: Alignment(0.9, 0.7),
              child: Text(res,
                  style: TextStyle(fontSize: 30, color: Colors.blue)),
            ),
          ),
          // Row(
          //   children: [
          //     Divider(color: Colors.black),
          //   ],
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: ElevatedButton(
                      onPressed: () {},
                      child: Text("",
                          style: TextStyle(
                              fontWeight: FontWeight.w800, fontSize: 19)),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(),
                          primary: Colors.blue,
                          onPrimary: Colors.white,
                          shadowColor: Colors.black87,
                          elevation: 50,
                          padding: EdgeInsets.symmetric(vertical: 25),
                          side: BorderSide(width: 0.5, color: Colors.white)))),
              Expanded(
                  child: ElevatedButton(
                      onPressed: ac,
                      child: Text("AC",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 19)),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(),
                          primary: Colors.blue,
                          onPrimary: Colors.white,
                          elevation: 50,
                          shadowColor: Colors.black87,
                          padding: EdgeInsets.symmetric(vertical: 25),
                          side: BorderSide(width: 0.5, color: Colors.white)))),
              Expanded(
                  child: ElevatedButton(
                      onPressed: one,
                      child: Text("<",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 19)),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(),
                          primary: Colors.blue,
                          onPrimary: Colors.white,
                          shadowColor: Colors.black87,
                          elevation: 50,
                          padding: EdgeInsets.symmetric(vertical: 25),
                          side: BorderSide(width: 0.5, color: Colors.white)))),
              button("/")
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [button("7"), button("8"), button("9"), button("*")],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [button("4"), button("5"), button("6"), button("-")],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [button("1"), button("2"), button("3"), button("+")],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              button("%"),
              button("0"),
              button("."),
              Expanded(
                  child: ElevatedButton(
                      onPressed: output,
                      child: Text("=",
                          style: TextStyle(
                              fontWeight: FontWeight.w800, fontSize: 19)),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(),
                          primary: Colors.blue,
                          onPrimary: Colors.white,
                          shadowColor: Colors.black87,
                          elevation: 50,
                          padding: EdgeInsets.symmetric(vertical: 25),
                          side: BorderSide(width: 0.5, color: Colors.white)))),
            ],
          ),
        ],
      ),
    );
  }
}
