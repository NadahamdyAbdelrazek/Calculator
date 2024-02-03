import 'package:calculator/calculator_button.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {

  CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String resulttext ="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text("Calculator", style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white10),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch,children: [
        Expanded(
            child: Text(
          resulttext,
          style: TextStyle(fontSize: 20),
        )),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CalculatorButton(text: "7",onbtnclick:onDigitClick),
              CalculatorButton(
                onbtnclick: onDigitClick,
                text: "8",
              ),
              CalculatorButton(
                onbtnclick: onDigitClick,
                text: "9",
              ),
              CalculatorButton(
                onbtnclick: onOperatorClick,
                text: "/",
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CalculatorButton(onbtnclick: onDigitClick,text: "4"),
              CalculatorButton(
                onbtnclick: onDigitClick,
                text: "5",
              ),
              CalculatorButton(
                onbtnclick: onDigitClick,
                text: "6",
              ),
              CalculatorButton(
                onbtnclick: onOperatorClick,
                text: "*",
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CalculatorButton(onbtnclick: onDigitClick,text: "1"),
              CalculatorButton(
                onbtnclick: onDigitClick,
                text: "2",
              ),
              CalculatorButton(
                onbtnclick: onDigitClick,
                text: "3",
              ),
              CalculatorButton(
                onbtnclick: onOperatorClick,
                text: "-",
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CalculatorButton(onbtnclick: onDigitClick,text: "."),
              CalculatorButton(
                onbtnclick: onDigitClick,
                text: "0",
              ),
              CalculatorButton(
                onbtnclick: onEqualityClick,
                text: "=",
              ),
              CalculatorButton(
                onbtnclick: onOperatorClick,
                text: "+",
              ),
            ],
          ),
        ),
      ]),
    );
  }
  String savednumber="";   //7
  String savedoperator="";  //+

  onEqualityClick(String btnText){
    String newnumber=resulttext;
    String result=calculate(savednumber,savedoperator,newnumber);
    resulttext=result;
    savednumber="";
    savedoperator="";
    setState(() {});
  }
  onOperatorClick(String btnText ){
    if(savednumber.isEmpty){
      savednumber=resulttext;
      savedoperator=btnText;
      resulttext="";
      setState(() {});
    }else{
      String newnumber=resulttext;
      String result=calculate(savednumber,savedoperator,newnumber);
      savednumber=result;
      savedoperator=btnText;
      resulttext="";
      setState(() {});
    }

  }


  void onDigitClick(String btntext){
    print("Click on $btntext");
    setState(() {});
    resulttext+=btntext;
  }

  String calculate(String savednumber, String savedoperator, String newnumber) {
    double n1=double.parse(savednumber);
    double n2=double.parse(newnumber);
    double res=0;
    if(savedoperator=="+"){
      res=n1+n2;
    }else if(savedoperator=="-"){
      res=n1-n2;
    }else if(savedoperator=="*"){
      res=n1*n2;
    }else if(savedoperator=="/"){
      res=n1/n2;
    }
    return res.toString();
  }
}


