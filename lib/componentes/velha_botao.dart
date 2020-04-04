import 'package:flutter/material.dart';

class VelhaBotao extends StatelessWidget {
  final void Function() onPressed;
  final String text;

  VelhaBotao({this.text = '', this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      child: Container(
        height: 100,
        width: 100,
        color: Colors.blue,
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontSize: 80),
          ),
        ),
      ),
    );
  }
}
