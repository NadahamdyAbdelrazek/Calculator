import 'package:flutter/material.dart';

class calbutton extends StatelessWidget {
  String label;
  Function onclick;
   calbutton({super.key,required this.label,required this.onclick});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {onclick(label);},
        child: Text(label,style: TextStyle(fontSize: 30,color: Colors.white)),
        style: ElevatedButton.styleFrom(backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8))),
      ),
    );
  }
}
