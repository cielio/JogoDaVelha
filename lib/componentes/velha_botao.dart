import 'package:flutter/material.dart';

class VelhaBotao extends StatefulWidget {
  final void Function() onPressed;
  final String image;

  VelhaBotao({this.image = '', this.onPressed});

  @override
  _VelhaBotaoState createState() => _VelhaBotaoState();
}

class _VelhaBotaoState extends State<VelhaBotao> {
  bool _isButtonDisabled = false;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        if (_isButtonDisabled) {
          return null;
        } else {
          widget.onPressed();
          _isButtonDisabled = true;
        }
      },
      child: Container(
        height: 100,
        width: 100,
        child: Image.asset('images/${widget.image}.png'),
      ),
    );
  }
}
