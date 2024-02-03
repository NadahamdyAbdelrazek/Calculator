import 'package:calculator/cal_Button.dart';
import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {

  Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String displayresult="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Calculator")),
      backgroundColor: Colors.blue,
      body: Column(children: [
        Expanded(
          child: Container(alignment: Alignment.centerLeft,
              color: Colors.white,
              width: double.infinity,
              child: Text(displayresult,
                style: TextStyle(fontSize: 25, color: Colors.white),
              )),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              calbutton(label: "9",onclick: clickedBtn),
              calbutton(label: "8",onclick: clickedBtn),
              calbutton(label: "7",onclick: clickedBtn),
              calbutton(label: "/",onclick: onOperatorClick),
            ],
          ),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              calbutton(label: "6",onclick: clickedBtn),
              calbutton(label: "5",onclick: clickedBtn),
              calbutton(label: "4",onclick: clickedBtn),
              calbutton(label: "*",onclick: onOperatorClick),
            ],
          ),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              calbutton(label: "3",onclick: clickedBtn),
              calbutton(label: "2",onclick: clickedBtn),
              calbutton(label: "1",onclick: clickedBtn),
              calbutton(label: "-",onclick: onOperatorClick),
            ],
          ),
        ),
        Expanded(
            child:
                Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          calbutton(label: "0",onclick: clickedBtn),
          calbutton(label: ".",onclick: clickedBtn),
          calbutton(label: "=",onclick: onEqulClick),
          calbutton(label: "+",onclick: onOperatorClick),
        ])),
      ]),
    );
  }
  onEqulClick(equalOperation){
    displayresult=calculate(lhs, rhs, op);
    op=equalOperation;
    setState(() {

    });
  }
    String lhs="";
    String rhs="";
    String op="";
calculate(String lhs,String rhs,String op) {
  double lHs = double.parse(lhs);
  double rHs = double.parse(rhs);
  if (op == "+") {
    double res = lHs + rHs;
    return res.toString();
  } else if (op == "-") {
    double res = lHs + rHs;
    return res.toString();
  } else if (op == "*") {
    double res = lHs + rHs;
    return res.toString();
  } else if (op == "/") {
    double res = lHs + rHs;
    return res.toString();
  }
  return "";
}
  onOperatorClick(operation){
    if(op.isEmpty) {
      lhs = displayresult;
      displayresult = "";
    }else{
      lhs=calculate(lhs, displayresult, op);
    }
    op = operation;
    displayresult="";
    print(lhs);
    setState(() {

    });
  }

  clickedBtn(label){
  if(op=="="){
    displayresult="";
    op="";
    lhs="";
  }
    displayresult+=label;
    setState(() {
      
    });

  }
}
