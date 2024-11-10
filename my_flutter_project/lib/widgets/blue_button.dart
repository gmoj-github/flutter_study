import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BlueButton extends StatelessWidget {

  String text;
  Function onClick;

  BlueButton(this.text, this.onClick);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
      ),
      onPressed: () => onClick(),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    );
  }
}
