import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
   String text;
   Function? onbtnclick;
   CalculatorButton({required this.text,super.key,required this.onbtnclick});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: ElevatedButton(
              onPressed: () {onbtnclick!(text);},
              child: Text(
                text,
                style: TextStyle(fontSize: 20,color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)))),
        ));
  }
}
